

#import "Bike.h"

@implementation Bike

-(VehicleType) getVehicleType
{
    return MotorBike;
}

-(EngineType) getEngineType
{
    return Petrol;
}

-(NSInteger) getNumberOfWheels
{
    return 2;
}

-(NSString *) getDetails
{
    return @"Motor bike with petrol engine and two wheels";
}

@end
