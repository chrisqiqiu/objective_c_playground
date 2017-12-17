
#import <Foundation/Foundation.h>
#import "Board.h"
#import "Constants.h"

@interface Game : NSObject
{
    Board *theBoard;
    PieceColor currentPlayer;
    int numMoves;
    char entryString[ENTRYMAX];
}

-(void) setUpGame;
-(void) printBoard;
-(void) printWinner;
-(void) printMenu;
-(void) nextMove;
-(int) hasEnded;



@end
