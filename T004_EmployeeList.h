

#import <Foundation/Foundation.h>

#import "Employee.h"

static const int MAXEMP = 20;

@interface EmployeeList : NSObject
{
    Employee* employees[MAXEMP];
    int numEmployee;
}

-(EmployeeList *) init;
-(void) addName: (NSString*) name andRate: (double) r andNumber: (int) n;

-(void) printEmployees;
-(void) sortEmployees;
  
@end
