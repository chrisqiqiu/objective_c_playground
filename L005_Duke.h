
#import "Piece.h"

@interface Duke : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getDukeValue;

-(Duke *) initWithColor: (PieceColor) theColor;

-(char*) getPieceChar;
-(int) moveMakesPrince: (Move *) theMove;

@end
