

#import "Vehicle.h"


@implementation Vehicle

-(VehicleType) getVehicleType
{
    return NoVehicle;
}

-(EngineType) getEngineType
{
    return NoEngine;
}

-(NSInteger) getNumberOfWheels
{
    return 0;
}

-(NSString *) getDetails
{
    return @"No vehicle";
}

@end
