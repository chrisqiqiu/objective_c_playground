
#import "Piece.h"

@interface Prince : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getPrinceValue;

-(Prince*) initWithColor: (PieceColor) theColor;

-(char*) getPieceChar;

@end
