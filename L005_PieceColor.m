
#import "PieceColor.h"

@implementation PieceColorTool


+(PieceColor) oppositeColor: (PieceColor) otherColor
{
    if (otherColor == white) return black;
    if (otherColor == black) return white;
    return otherColor;
}

@end
