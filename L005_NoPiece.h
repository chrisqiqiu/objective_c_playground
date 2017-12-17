
#import "Piece.h"

@interface NoPiece : Piece

-(BOOL) legalMove: (Move *) theMove;

-(int) getPieceValue;
+(int) getNoPieceValue;

-(char*) getPieceChar;

@end
