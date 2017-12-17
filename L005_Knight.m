
#import "Knight.h"

@implementation Knight

-(BOOL) legalMove: (Move *) theMove
{
    // have we have moved 2 then 1 space or 1 then 2 space
    // 2 * 1 == 1 * 2 == 2
    
    return (abs([theMove xMove] * [theMove yMove]) == 2);
}

+(int) getKnightValue
{
    return 4;
}

-(int) getPieceValue
{
    return [Knight getKnightValue];
}

-(Knight *) initWithColor: (PieceColor) theColor
{
    self = [super init];
    
    pieceColor = theColor;
    pieceType = knight;
    
    return self;
}

-(char*) getPieceChar
{
        if (pieceColor == white) return " K ";
        else return "(k)";
}

@end
