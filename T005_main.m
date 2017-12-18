

#import <Foundation/Foundation.h>

#import "Vehicle.h"
#import "Bike.h"
#import "Car.h"
#import "Trike.h"
#import "Truck.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        @try{
            // insert code here...
            Vehicle* vehicles[8];
            int numVehicle = 4;
            
            vehicles[0] = [[Bike alloc] init];
            vehicles[1] = [[Car alloc] init];
            vehicles[2] = [[Trike alloc] init];
           
            vehicles[3] = [[Truck alloc] initWithWheels:8];
            //NSLog(@"%d",7%2);
            
            for (int i=0; i<numVehicle; i++)
            {
                NSLog(@"%@", [vehicles[i] getDetails]);
            }
        }
        @catch(NSException *exception){
            NSLog(@"Catch - name: %@ reason: %@", [exception name], [exception reason]);
        }
    }
    return 0;
}

