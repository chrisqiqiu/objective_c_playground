

#import "exObject.h"

@implementation exObject

-(int) getData
{
    return data;
}

-(void) setDataWithNumber: (NSNumber *) aNumber
{
    data = [aNumber intValue];
}

-(void) setDataWithInt:(int)aNumber
{
    data = aNumber;
}

-(NSComparisonResult) orderObject : (exObject *) other
{
    if ([other getData] < data) return NSOrderedDescending;
    if ([other getData] > data) return NSOrderedAscending;
    return NSOrderedSame;
}

-(BOOL) isEqual: (exObject *) other
{
    return data == [other getData];
}


@end
