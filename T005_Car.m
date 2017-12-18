

#import "Car.h"

@implementation Car

-(VehicleType) getVehicleType
{
    return MotorCar;
}

-(EngineType) getEngineType
{
    return Petrol;
}

-(NSInteger) getNumberOfWheels
{
    return 4;
}

-(NSString *) getDetails
{
    return @"Motor car with petrol engine and four wheels";
}


@end
