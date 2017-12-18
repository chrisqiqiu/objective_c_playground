

#import "Vehicle.h"

@interface Truck : Vehicle
{
    NSInteger numberOfWheels;
}


-(Truck*) initWithWheels: (NSInteger) noOfWheels;


@end
