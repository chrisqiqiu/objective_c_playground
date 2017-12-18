

#import "Truck.h"

@implementation Truck

-(Truck*) initWithWheels: (NSInteger) noOfWheels
{
    if(noOfWheels%2!=0)
    {
        NSException *notEvenException = [NSException exceptionWithName:@"notEvenException" reason:@"not a even number" userInfo:nil];
        
        @throw notEvenException;
    }
    
    self = [super init];
    
    numberOfWheels = noOfWheels;
    
    return self;
}

-(VehicleType) getVehicleType
{
    return MotorTruck;
}

-(EngineType) getEngineType
{
    return Petrol;
}

-(NSInteger) getNumberOfWheels
{
    return numberOfWheels;
}

-(NSString *) getDetails
{
    NSString* details = [NSString stringWithFormat:@"Motor Truck with petrol engine and %d wheels", (int)numberOfWheels];
    return details;
}

@end
