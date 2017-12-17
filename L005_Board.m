#import "Board.h"
#import "NoPiece.h"
#import "Rook.h"
#import "Knight.h"
#import "Bishop.h"
#import "Duke.h"
#import "Prince.h"

@implementation Board


+(BOOL) insideBoardAtX:(int) x andY: (int) y
{
    if (x < 0 || x >= MAXDIM) return false;
    if (y < 0 || y >= MAXDIM) return false;
    return true;
}


-(void) clearBoard
{
    int x, y;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            squares[y][x] = [[NoPiece alloc] init];
        }
    }
}

-(void) setupBoard
{
    int x;
    
    // setup black side
    squares[0][0] = [[Knight alloc] initWithColor:black];
    squares[0][1] = [[Duke alloc] initWithColor:black];
    squares[0][2] = [[Bishop alloc] initWithColor:black];
    squares[0][3] = [[Rook alloc] initWithColor:black];
    
    // setup middle board
    for (x=0; x<MAXDIM; x++)
    {
        squares[1][x] = [[NoPiece alloc] init];
        squares[2][x] = [[NoPiece alloc] init];
    }
    
    // setup white side
    squares[3][0] = [[Rook alloc] initWithColor:white];
    squares[3][1] = [[Bishop alloc] initWithColor:white];
    squares[3][2] = [[Duke alloc] initWithColor:white];
    squares[3][3] = [[Knight alloc] initWithColor:white];
}

-(PieceType) getPieceTypeAtX: (int) x andY: (int) y
{
    return squares[y][x].pieceType;
}

-(PieceColor) getPieceColorAtX: (int) x andY: (int) y
{
    return squares[y][x].pieceColor;
}

-(Piece *) getPieceAtX: (int) x andY: (int) y
{
    return squares[y][x];
}

// moving functions ======================================

-(BOOL) squaresBetweenMoveEmpty : (Move *) theMove
{
    // Assumes the move is a diagonal or othoganol move
    // Determines if the squares between the from location and to location
    // are empty
    
    // work out how far the move is
    // if we are moving along an orthogonal then either addx or addy will be zero
    int addx = [theMove xMove];
    int addy = [theMove yMove];
    
    // workout which direction we are incrementing by
    if (addx < 0) addx = -1; else if (addx > 0) addx = 1;
    if (addy < 0) addy = -1; else if (addy > 0) addy = 1;
    
    // start shifting in the direction of (tox, toy)
    int shiftx = [theMove fromX] + addx;
    int shifty = [theMove fromY] + addy;
    
    while (![theMove atToX:shiftx andY: shifty])
    {
        // make sure we are inside board boundaries
        if (![Board insideBoardAtX:shiftx andY:shifty]) return false;
        
        // we can only move through a square if it is empty
        if ([self getPieceTypeAtX:shiftx andY:shifty] != noPiece) return false;
        
        // move to the next square between (fromx, fromy) and (tox, toy)
        shiftx += addx;
        shifty += addy;
    }
    return true;
}

-(BOOL) moveOnBoard: (Move *) theMove
{
    if (![Board insideBoardAtX:theMove.fromX andY: theMove.fromY]) return false;
    if (![Board insideBoardAtX:theMove.toX andY: theMove.toY]) return false;
    
    return true;
}

-(BOOL) moveLegal:(PieceColor) playerColor withMove: (Move *) theMove
{
    // confirm the move is within the board boundaries
    if (![self moveOnBoard:theMove]) return false;
    
    Piece *pc = [self getPieceAtX:theMove.fromX andY:theMove.fromY];
    
    // confirm the current player has a piece at moveFrom square
    if (pc.pieceColor != playerColor) return false;
    
    // confirm the moveTo square does not have a piece of the same color
    // this eliminates zero moves
    if ([self getPieceColorAtX:theMove.toX andY:theMove.toY] == playerColor) return false;
        
    // confirm the move is legal for the piece
    if (![pc legalMove:theMove]) return false;
        
    PieceType pt = pc.pieceType;
    if (pt == bishop || pt == rook || pt == prince)
    {
        // confirm for bishop, rook and prince there are no occupied intervening squares
        return [self squaresBetweenMoveEmpty:theMove];
    }
    else if (pt == knight || pt == duke)
    {
        // move for other pieces is good
        return true;
    }
    else
    {
        @throw ([NSException exceptionWithName:@"moveLegal" reason:@"unknown piece type" userInfo:nil]);
        return false;
    }
}

-(BOOL) movePlayer:(PieceColor) playerColor withMove: (Move *) theMove
{
    // check for legality of move
    if ([self moveLegal:playerColor withMove:theMove] == false) return false;
        
    // get the player piece
    Piece *playerPiece = squares[theMove.fromY][theMove.fromX];
    
    // replace the vacated square with a noPiece
    squares[theMove.fromY][theMove.fromX] = [[NoPiece alloc] init];
    
    // see if we have a duke being promoted to a prince
    if ([playerPiece isDuke])
    {
        // cast playerPiece as a duke
        Duke *tempDuke = (Duke *) playerPiece;
        
        // see if duke has reached other side and promote to prince if true
        if ([tempDuke moveMakesPrince:theMove])
        {
            playerPiece = [[Prince alloc] initWithColor:playerColor];
        }
    }
    
    // move the piece
    squares[theMove.toY][theMove.toX] = playerPiece;
    
    return true;
}

// scoring functions ======================================

-(int) valueOfRemainingWhite
{
    int x, y, value=0;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            if ([self getPieceColorAtX:x andY:y] == white)
            {
                value += [[self getPieceAtX:x andY:y] getPieceValue];
            }
        }
    }
    return value;
}

-(int) valueOfRemainingBlack
{
    int x, y, value=0;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            if ([self getPieceColorAtX:x andY:y] == black)
            {
                value += [[self getPieceAtX:x andY:y] getPieceValue];
            }
        }
    }
    return value;
}

-(int) numWhitePiecesLeft
{
    int x, y, num=0;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            if ([self getPieceColorAtX:x andY:y] == white) num++;
        }
    }
    return num;    
}

-(int) numBlackPiecesLeft
{
    int x, y, num=0;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            if ([self getPieceColorAtX:x andY:y] == black) num++;
        }
    }
    return num;
}

-(int) numPlayerPieces: (PieceColor) player
{
    if (player == white) return [self numWhitePiecesLeft];
    else if (player == black) return [self numBlackPiecesLeft];
    else return 0;
}

-(int) currentScoreOfPlayer : (PieceColor) player;
{
    int x, y, score=0;
    PieceColor c;
    
    for (y=0; y<MAXDIM; y++)
    {
        for (x=0; x<MAXDIM; x++)
        {
            c = [self getPieceColorAtX:x andY:y];
            
            if (c == white)
            {
                score += [[self getPieceAtX:x andY:y] getPieceValue];
            }
            else if (c == black)
            {
                score -= [[self getPieceAtX:x andY:y] getPieceValue];
            }
        }
    }
    
    if (player == white) return score;
    else return -score;
}

// printing functions ====================================

-(void) printRow :(int) y
{
    // print the center of the squares, showing the pieces
    char row = '0' + y;
    char line[MAXDIM * 8];
    
    line[0] = row;
    line[1] = '\0';
    
    strcat(line, " |");
    for (int x=0; x<MAXDIM; x++)
    {
        strcat(line, [[self getPieceAtX:x andY:y] getPieceChar]);
        strcat(line, "|");
    }
    
    NSLog(@"%s", line);
}

-(void) printMiddleLine
{
    // print a ----+--- etc line
    char line[MAXDIM * 8];
    
    strcpy(line, "  |-");
    for (int x=0; x<MAXDIM-1; x++)
    {
        strcat(line, "--+-");
    }
    strcat(line, "--|");
    
    NSLog(@"%s", line);
}

-(void) printOuterLine
{
    // print top and bottom line of board
    char line[MAXDIM * 8];
    
    strcpy(line, "   -");
    for (int x=0; x<MAXDIM-1; x++)
    {
        strcat(line, "----");
    }
    strcat(line, "--");
    
    NSLog(@"%s", line);
}

-(void) printBottomLine
{
    // bottom of board showing column letters
    // print top and bottom line of board
    char line[MAXDIM * 8];
    char letter[9];
    
    strcpy(letter, "    ");
    
    strcpy(line, "    ");
    for (int x=0; x<MAXDIM; x++)
    {
        letter[0] = 'a' + x;
        strcat(line, letter);
    }
    
    NSLog(@"%s", line);
}

-(void) printBoard
{
    // print entire board
    NSLog(@"       (black)");
    [self printOuterLine];
    for (int y=0; y<MAXDIM; y++)
    {
        [self printRow:y];
        if (y < MAXDIM-1) [self printMiddleLine];
    }
    [self printOuterLine];
    [self printBottomLine];    
    NSLog(@"        WHITE");
}

-(void) printScore
{
    NSLog(@"White score = %d : Black score = %d", [self valueOfRemainingWhite], [self valueOfRemainingBlack]);
}

@end
