//
//  WWLocationManager.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 1/27/16.
//  Copyright © 2016 BReginato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "WWAlarm.h"

@interface WWLocationManager : NSObject <CLLocationManagerDelegate>
+(instancetype) manager;

-(void)startMonitoringAlarm:(WWAlarm *) alarm;
-(void)stopMonitoring:(WWAlarm *) alarm;

@end
