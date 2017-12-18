

#import <Foundation/Foundation.h>

#import "exObject.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        exObject *myObject;
        NSArray *myArray = [[NSArray alloc] init];
        NSArray *sorted1, *sorted2;
        NSString *line = [[NSString alloc] init];
        
        // build array of random data ============================
        for (int i=0; i<13; i++)
        {
            myObject = [[exObject alloc] init];
            [myObject setDataWithInt: (i * 7) % 10];
            myArray = [myArray arrayByAddingObject:myObject];
        }
        
        // print array using for loop ============================
        NSLog(@"Unsorted array");
        for (exObject *data in myArray)
        {
            line = [line stringByAppendingFormat:@" %d", [data getData]];
        }
        NSLog(@"%@", line);
        
        // check for existance ===================================
        myObject = [[exObject alloc] init];
        [myObject setDataWithInt:8];
        if ([myArray containsObject:myObject])
        {
            NSInteger index = [myArray indexOfObject:myObject];
            NSLog(@"Array contains %d at location %d", [myObject getData], (int) index);
        }
        else
        {
            NSLog(@"Array does not contain %d ", [myObject getData]);
        }
        
        myObject = [[exObject alloc] init];
        [myObject setDataWithInt:11];
        if ([myArray containsObject:myObject])
        {
            NSLog(@"Array contains %d", [myObject getData]);
        }
        else
        {
            NSLog(@"Array does not contain %d", [myObject getData]);
        }
        
        // ascending sort array using selector ====================
        sorted1 = [myArray sortedArrayUsingSelector:@selector(orderObject:)];
                
        NSLog(@"After sorting using selector");
        line  = @"";
        for (exObject *data in sorted1)
        {
            line = [line stringByAppendingFormat:@" %d", [data getData]];
        }
        NSLog(@"%@", line);
        
        // descending sort array using code block ================
        sorted2 = [myArray sortedArrayUsingComparator:^NSComparisonResult(exObject *obj1, exObject *obj2) {
            NSComparisonResult result = [obj1 orderObject:obj2];
            if (result == NSOrderedAscending) return NSOrderedDescending;
            if (result == NSOrderedDescending) return NSOrderedAscending;
            return result;
        }];
        
        NSLog(@"After sorting using comparator");
        line  = @"";
        for (exObject *data in sorted2)
        {
            line = [line stringByAppendingFormat:@" %d", [data getData]];
        }
        NSLog(@"%@", line);

    }
    return 0;
}

