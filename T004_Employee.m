

#import "Employee.h"

@implementation Employee

-(void) setName: (NSString*) name andRate: (double) r andNumber: (int) n;
{
    surname = name;
    empNumber = n;
    hourlyRate = r;
}

-(void) printEmployee
{
    NSLog(@"%20@ %4d %f", surname, empNumber, hourlyRate);
}

-(int) getEmployeeNumber
{
    return empNumber;
}

@end
