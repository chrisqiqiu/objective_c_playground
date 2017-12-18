

#import "EmployeeList.h"

@implementation EmployeeList

-(EmployeeList *) init
{
    self = [super init];
    
    for (int i=0; i<MAXEMP; i++)
    {
        employees[i] = [[Employee alloc] init];
    }
    
    numEmployee = 0;
    
    return self;
}

-(void) addName: (NSString*) name andRate: (double) r andNumber: (int) n
{
    if (numEmployee < 20)
    {
        [employees[numEmployee] setName: name andRate: r andNumber: n];
        numEmployee++;
    }
}

-(void) printEmployees
{

    for(int i=0 ; i <numEmployee ; i++ )
    {
        [employees[i] printEmployee];
    }
    NSLog(@"\0");
}


-(void) swapEmployee: (int) i withOther: (int) j
{

    Employee* tempEmployee;
    
    tempEmployee = employees[i];
    
    employees[i] = employees[j];
    
    employees[j] = tempEmployee;

}

-(void) sortEmployees
{
    // simple insertion sort of employees
    
    int inner, outer;
    
    for (outer = 1; outer < numEmployee - 1; outer++)
    {
        for (inner = outer; inner >= 0; inner--)
        {
            if ([employees[inner] getEmployeeNumber] >
                [employees[inner+1] getEmployeeNumber])
            {
                [self swapEmployee: inner withOther: inner+1];
            }
        }
    }
    
}

@end
