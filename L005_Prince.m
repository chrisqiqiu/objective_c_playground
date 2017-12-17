
#import "Prince.h"

@implementation Prince

-(BOOL) legalMove: (Move *) theMove
{
    // prince moves as a bishop or rook
    return ([theMove diagonalMove] || [theMove orthoganolMove]);
}

+(int) getPrinceValue
{
    return 9;
}

-(int) getPieceValue
{
    return [Prince getPrinceValue];
}

-(Prince *) initWithColor: (PieceColor) theColor
{
    self = [super init];
    
    pieceColor = theColor;
    pieceType = prince;
    
    return self;
}

-(char*) getPieceChar
{
    if (pieceColor == white) return " P ";
    else return "(p)";
}

@end
