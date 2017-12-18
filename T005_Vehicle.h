

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VehicleType)
{
    NoVehicle, MotorBike, MotorCar, MotorTruck, MotorTrike
};

typedef NS_ENUM(NSInteger, EngineType)
{
    NoEngine, Petrol, Diesel
};

@interface Vehicle : NSObject

-(VehicleType) getVehicleType;
-(EngineType) getEngineType;
-(NSInteger) getNumberOfWheels;
-(NSString *) getDetails;

@end
