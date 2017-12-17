
#import "Piece.h"

@interface Bishop : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getBishopValue;

-(Bishop *) initWithColor: (PieceColor) theColor;

-(char*) getPieceChar;

@end
