
#import "Move.h"

@implementation Move

@synthesize fromX, fromY, toX, toY;

-(void) setFromX: (int) fx andY: (int) fy toX: (int) tx andY: (int) ty
{
    fromX = fx;
    fromY = fy;
    toX = tx;
    toY = ty;
}

-(int) xMove
{
    NSLog(@"Got here");
    return (toX - fromX);
}

-(int) yMove
{
    return (toY - fromY);
}

-(int) atToX:(int) x andY:(int) y;
{
    return (toX == x && toY == y);
}

-(int) diagonalMove
{
    return (abs([self xMove]) == abs([self yMove]));
}

-(int) orthoganolMove
{
    return (toX == fromX || toY == fromY);
}

-(int) moveOneSpaceOnly
{
    return (abs([self xMove] <=1 && abs([self yMove]) <= 1));
}

-(int) splitUpEnteredMove : (char *) entry
{
    // move string must be in form
    // aX bY\n
    // a and b are valid colums, X and Y are valid rows
    
    if (entry == NULL) return false;
    
    if (strlen(entry) != 6) return false;
    if (entry[2] != ' ') return false;
    
    fromX = entry[0] - 'a';
    fromY = entry[1] - '0';
    
    toX = entry[3] - 'a';
    toY = entry[4] - '0';
    
    return true;
}

@end
