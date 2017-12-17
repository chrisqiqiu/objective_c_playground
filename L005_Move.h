
#import <Foundation/Foundation.h>

@interface Move : NSObject
{
    int fromX, fromY, toX, toY;
}

@property int fromX, fromY, toX, toY;

-(void) setFromX: (int) fx andY: (int) fy toX: (int) tx andY: (int) ty;

// how big is the move
-(int) xMove;
-(int) yMove;

// are we moving to location x, y
-(int) atToX:(int) x andY:(int) y;

// type of move
-(int) diagonalMove;
-(int) orthoganolMove;
-(int) moveOneSpaceOnly;
-(int) splitUpEnteredMove : (char *) entry;

@end
