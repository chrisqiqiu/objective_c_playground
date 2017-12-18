

#import <Foundation/Foundation.h>
#import "EmployeeList.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        EmployeeList *employees = [[EmployeeList alloc] init];
                
        [employees addName:@"Stone" andRate:35.76 andNumber:053];
        [employees addName:@"Rubble" andRate:12 andNumber:163];
        [employees addName:@"Flintstone" andRate:15.75 andNumber:97];
        [employees addName:@"Pebble" andRate:10.25 andNumber:104];
        [employees addName:@"Rockwall" andRate:22.75 andNumber:15];
        
        [employees printEmployees];
        [employees sortEmployees];
        [employees printEmployees];
    }
    return 0;
}

