//#if __has_include("RCTBridgeModule.h")
//    #import "RCTBridgeModule.h"
//#else
//    #import <React/RCTBridgeModule.h>
//#endif

#if __has_include(<React/RCTBridgeModule.h>)
    #import <React/RCTBridgeModule.h>
#else
    #import "RCTBridgeModule.h"
#endif


#if __has_include(<React/RCTEventEmitter.h>)
    #import <React/RCTEventEmitter.h>
#else
    #import "RCTEventEmitter.h"
#endif

#import "LocationTracker.h"

@interface RNBackgroundLocationUpdate : RCTEventEmitter <RCTBridgeModule>
@property LocationTracker * locationTracker;
@property (nonatomic) NSTimer* locationUpdateTimer;
@end
  
