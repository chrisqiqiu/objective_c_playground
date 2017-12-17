
#import <Foundation/Foundation.h>

#import "Game.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Game *theGame = [[Game alloc] init];
        
        [theGame setUpGame];
        [theGame printMenu];
        [theGame printBoard];
        
        while ([theGame hasEnded] == false)
        {
            [theGame nextMove];
        }
        [theGame printWinner];
    }
    return 0;
}

