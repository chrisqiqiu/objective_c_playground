
#import <Foundation/Foundation.h>
#import "Move.h"
#import "Piece.h"
#import "Constants.h"

@interface Board : NSObject
{
    // the array that holds the board and the pieces on it
    Piece* squares[MAXDIM][MAXDIM];
}

+(BOOL) insideBoardAtX:(int) x andY: (int) y;

-(void) setupBoard;
-(void) clearBoard;

-(BOOL) squaresBetweenMoveEmpty : (Move *) theMove;

-(PieceType) getPieceTypeAtX: (int) x andY: (int) y;
-(PieceColor) getPieceColorAtX: (int) x andY: (int) y;
-(Piece *) getPieceAtX: (int) x andY: (int) y;

-(BOOL) movePlayer:(PieceColor) playerColor withMove: (Move *) theMove;
-(BOOL) moveLegal:(PieceColor) playerColor withMove: (Move *) theMove;

-(int) valueOfRemainingWhite;
-(int) valueOfRemainingBlack;

-(int) numWhitePiecesLeft;
-(int) numBlackPiecesLeft;
-(int) numPlayerPieces : (PieceColor) player;

-(int) currentScoreOfPlayer : (PieceColor) player;

-(void) printBoard;
-(void) printScore;

@end
