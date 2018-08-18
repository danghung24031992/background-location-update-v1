
#import "RNBackgroundLocationUpdate.h"
#import <UIKit/UIKit.h>

@implementation RNBackgroundLocationUpdate

- (NSArray<NSString *> *)supportedEvents {
    return @[@"didUpdateLocation"];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(startLocationTracking)
{
    NSLog(@"startLocationTracking");
    // UIAlertView * alert;
    
    //We have to make sure that the Background App Refresh is enable for the Location updates to work in the background.
    if([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusDenied){
        
//        alert = [[UIAlertView alloc]initWithTitle:@""
//                                          message:@"The app doesn't work without the Background App Refresh enabled. To turn it on, go to Settings > General > Background App Refresh"
//                                         delegate:nil
//                                cancelButtonTitle:@"Ok"
//                                otherButtonTitles:nil, nil];
//        [alert show];
        
    }else if([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusRestricted){
        
//        alert = [[UIAlertView alloc]initWithTitle:@""
//                                          message:@"The functions of this app are limited because the Background App Refresh is disable."
//                                         delegate:nil
//                                cancelButtonTitle:@"Ok"
//                                otherButtonTitles:nil, nil];
//        [alert show];
    } else{
        
        self.locationTracker = [[LocationTracker alloc]init];
        [self.locationTracker startLocationTracking];
        
        //Send the best location to server every 30 seconds
        //You may adjust the time interval depends on the need of your app.
        NSTimeInterval time = 30.0;
        
        self.locationUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:time
                                                                    target:self
                                                                  selector:@selector(updateLocation)
                                                                  userInfo:nil
                                                                   repeats:YES];
    }
}

RCT_EXPORT_METHOD(stopLocationTracking)
{
    [self.locationTracker stopLocationTracking];
}

-(void)updateLocation {
    NSLog(@"didUpdateLocation");
    [self.locationTracker updateLocationToServer:^(NSDictionary * location) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC),
                       dispatch_get_main_queue(), ^(void){
                           [self sendEventWithName:@"didUpdateLocation" body:location];
                       });
    }];
}

@end

