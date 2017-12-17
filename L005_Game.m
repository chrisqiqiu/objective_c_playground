
#import "Game.h"
#import "Constants.h"
#import "Move.h"
#import "NoPiece.h"
#import "Rook.h"
#import "Knight.h"
#import "Bishop.h"
#import "Duke.h"
#import "Prince.h"
#import "PieceColor.h"

@implementation Game


-(void) setUpGame
{
    currentPlayer = white;
    numMoves = 0;
    theBoard = [[Board alloc] init];
    [theBoard setupBoard];
}

-(void) printBoard
{
    [theBoard printBoard];
}

-(void) printWinner
{
    int scoreWhite = [theBoard valueOfRemainingWhite];
    int scoreBlack = [theBoard valueOfRemainingBlack];
    
    NSLog(@" ");
    if (scoreWhite > scoreBlack)
    {
        NSLog(@"After %d moves white has won with a score of %d to %d", numMoves, scoreWhite, scoreBlack);
    }
    else if (scoreBlack > scoreWhite)
    {
        NSLog(@"After %d moves black has won with a score of %d to %d", numMoves, scoreBlack, scoreWhite);
    }
    else
    {
        NSLog(@"After %d moves it's a draw with a score of %d each", numMoves, scoreWhite);
    }
}

-(void) printMenu
{
    NSLog(@" ");
    NSLog(@"INSTRUCTIONS");
    NSLog(@"m      : print this menu");
    NSLog(@"q      : quit the game");
    NSLog(@"a2 b3  : move piece from a2 to b3");
    NSLog(@" ");
}

-(char*) getMove
{
    NSLog(@" ");
    if (currentPlayer == white)
    {
        NSLog(@"%d. Next move, white to play", numMoves);
    }
    else
    {
        NSLog(@"%d. Next move, black to play", numMoves);
    }
    
    fgets(entryString, ENTRYMAX, stdin);
    return entryString;
}

-(void) nextMove
{
    // ask the user to enter a move, validate it and, if valid, run it
    int validMove = true;
    Move* theMove = [[Move alloc] init];
    
    [self getMove];
    
    if (strcmp(entryString, "q\n") == 0)
    {
        exit(0);
    }
    else if (strcmp(entryString, "m\n") == 0)
    {
        [self printMenu];
        return;
    }
    else
    {
        // the player has possibly entered a move instruction
        validMove = [theMove splitUpEnteredMove: entryString];
    }
    
    if (validMove)
    {
        // a properly formated move has been entered
        // now try and run it
        validMove = [theBoard movePlayer:currentPlayer withMove:theMove];
    }
    
    if (validMove)
    {
        // a properly formatted, legal move was entered
        [theBoard printBoard];
        [theBoard printScore];
        
        // swap the current player and update number of moves
        currentPlayer = [PieceColorTool oppositeColor:currentPlayer];
        numMoves++;
    }
    else
    {
        NSLog(@"Invalid move entered");
    }
}

-(int) hasEnded
{
    static int numMovesOneEach = 2;
    
    // Game ends if
    // 1. MAXMOVES made
    // 2. one side has no pieces left
    // 3. Each side has one piece left. It is impossible to force a win
    //    unless prince vs Knight or Duke vs Knight
    
    int remain = [theBoard numWhitePiecesLeft] * [theBoard numBlackPiecesLeft];
    
    if (remain == 1)
    {
        // each side has one remaining piece since only 1*1 == 1
        // it is still possible for a win under condition 3.
        
        int gameMult = [theBoard valueOfRemainingWhite] * [theBoard valueOfRemainingBlack];
        int gameAdd = [theBoard valueOfRemainingWhite] + [theBoard valueOfRemainingBlack];
        
        // determine if we have a knight vs a prince.
        // since there is only one piece a side, only a combination of a
        // knight and prince can make the following true
        int winnable = (gameMult == [Knight getKnightValue] * [Prince getPrinceValue] &&
                        gameAdd == [Knight getKnightValue] + [Prince getPrinceValue]);
        
        // or knight vs duke
        if (!winnable)
            winnable = (gameMult == [Knight getKnightValue] * [Duke getDukeValue] &&
                        gameAdd == [Knight getKnightValue] + [Duke getDukeValue]);
        
        // allow only a certain number of attempts to win from this position
        if (winnable) numMovesOneEach--;
    }
    
    int won = (numMoves >= MAXMOVES || remain == 0 || numMovesOneEach < 0);
    
    if (won) numMovesOneEach = 2;
    return won;
}


@end
