
#import <Foundation/Foundation.h>
#import "Move.h"
#import "Constants.h"
#import "PieceColor.h"

// enumeration of possible pieces on the board
// empty squares will hold a noPiece

typedef NS_ENUM(NSInteger, PieceType) {
    noPiece, bishop, knight, rook, duke, prince
};

@interface Piece : NSObject
{
    PieceColor pieceColor;
    PieceType pieceType;
}

@property PieceColor pieceColor;
@property PieceType pieceType;

-(BOOL) legalMove: (Move *) theMove;
-(int) getPieceValue;
-(char*) getPieceChar;

-(BOOL) isKnight;
-(BOOL) isBishop;
-(BOOL) isRook;
-(BOOL) isDuke;
-(BOOL) isPrince;
-(BOOL) isNoPiece;


@end
