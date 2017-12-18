

#import <Foundation/Foundation.h>

@interface Employee : NSObject
{
    NSString *surname;
    double hourlyRate;
    int empNumber;
}

-(void) setName: (NSString*) name andRate: (double) r andNumber: (int) n;
-(void) printEmployee;
-(int) getEmployeeNumber;

@end
