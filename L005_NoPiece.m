
#import "NoPiece.h"

@implementation NoPiece

-(BOOL) legalMove: (Move *) theMove
{
    return false;
}

+(int) getNoPieceValue
{
    return 0;
}

-(int) getPieceValue
{
    return [NoPiece getNoPieceValue];
}

-(char*) getPieceChar
{
    return "   ";
}

@end
