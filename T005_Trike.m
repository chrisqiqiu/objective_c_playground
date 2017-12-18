

#import "Trike.h"

@implementation Trike

-(VehicleType) getVehicleType
{
    return MotorTrike;
}

-(EngineType) getEngineType
{
    return Petrol;
}

-(NSInteger) getNumberOfWheels
{
    return 3;
}

-(NSString *) getDetails
{
    return @"Motor Trike with petrol engine and four wheels";
}


@end
