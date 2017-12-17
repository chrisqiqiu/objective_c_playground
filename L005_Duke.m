
#import "Duke.h"

@implementation Duke

-(BOOL) legalMove: (Move *) theMove
{
    // duke moves to an adjacent space
    return [theMove moveOneSpaceOnly];
}

+(int) getDukeValue
{
    return 7;
}

-(int) getPieceValue
{
    return [Duke getDukeValue];
}

-(Duke *) initWithColor: (PieceColor) theColor
{
    self = [super init];
    
    pieceColor = theColor;
    pieceType = duke;
    
    return self;
}

-(char*) getPieceChar
{
    if (pieceColor == white) return " D ";
    else return "(d)";
}

-(int) moveMakesPrince: (Move *) theMove
{
    if (pieceColor == white)
    {
        return (theMove.toY == 0);
    }
    else
    {
        return (theMove.toY == (MAXDIM -1));
    }
}

@end
