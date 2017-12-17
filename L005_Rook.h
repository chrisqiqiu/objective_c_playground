
#import "Piece.h"

@interface Rook : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getRookValue;

-(Rook *) initWithColor: (PieceColor) theColor;

-(char*) getPieceChar;

@end
