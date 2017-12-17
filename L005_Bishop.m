
#import "Bishop.h"

@implementation Bishop


-(Bishop *) initWithColor: (PieceColor) theColor
{
    self = [super init];
    
    pieceColor = theColor;
    pieceType = bishop;
    
    return self;
}

-(BOOL) legalMove: (Move *) theMove
{
    // bishop moves must be on the diagonal
    return [theMove diagonalMove];
}

-(char*) getPieceChar
{
    if (pieceColor == white) return " B ";
    else return "(b)";
}

+(int) getBishopValue
{
    return 3;
}

-(int) getPieceValue
{
    return [Bishop getBishopValue];
}
@end
