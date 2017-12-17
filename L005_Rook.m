
#import "Rook.h"

@implementation Rook


-(BOOL) legalMove: (Move *) theMove
{
    // rook moves must be on the orthogonal
    return [theMove orthoganolMove];
}

+(int) getRookValue
{
    return 6;
}

-(int) getPieceValue
{
    return [Rook getRookValue];
}

-(Rook *) initWithColor: (PieceColor) theColor
{
    self = [super init];
    
    pieceColor = theColor;
    pieceType = rook;
    
    return self;
}

-(char*) getPieceChar
{
    if (pieceColor == white) return " R ";
    else return "(r)";
}

@end
