

#import <Foundation/Foundation.h>

@interface exObject : NSObject
{
    int data;
}

-(int) getData;
-(void) setDataWithInt: (int) aNumber;
-(void) setDataWithNumber: (NSNumber *) aNumber;
-(NSComparisonResult) orderObject : (exObject *) other;

// overload isEqual method
-(BOOL) isEqual: (exObject *) other;

@end
