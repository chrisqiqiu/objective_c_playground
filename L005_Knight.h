
#import "Piece.h"

@interface Knight : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getKnightValue;

-(Knight *) initWithColor: (PieceColor) theColor;

-(char*) getPieceChar;

@end
