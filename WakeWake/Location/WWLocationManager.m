//
//  WWLocationManager.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 1/27/16.
//  Copyright © 2016 BReginato. All rights reserved.
//

#import "WWLocationManager.h"
#import "WWDataStore+Alarm.h"
#import "WWAlarm.h"

@interface WWLocationManager()
@property (strong,nonatomic) CLLocationManager* locationManager;
@end

@implementation WWLocationManager

+(instancetype) manager {
    static WWLocationManager *instace = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [[self alloc] init];
    });
    
    return instace;
}

- (instancetype)init {
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.delegate = self;
    
    return self;
}


#pragma  mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    WWAlarm *alarm = [self alarmFromRegion:region];
    
    if (alarm) {
        UILocalNotification * localNotification = [[UILocalNotification alloc]init];
        localNotification.soundName = alarm.soundName;
        localNotification.alertBody = alarm.name;
        //TODO: Colocar image do wake-me no alerta
    }
}

-(void)startMonitoringAlarm:(WWAlarm *) alarm {
    [self.locationManager startMonitoringForRegion:[self regionForAlarm:alarm]];
}

-(void)stopMonitoring:(WWAlarm *) alarm {
    [self.locationManager stopMonitoringForRegion:[self regionForAlarm:alarm]];
}

-(CLCircularRegion *)regionForAlarm:(WWAlarm *) alarm{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(alarm.latitude.doubleValue, alarm.longitude.doubleValue);
    
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:center radius:alarm.radius.doubleValue identifier: [NSString stringWithFormat: @"%u",alarm.identifier.integerValue]];
    
    return region;
}

-(WWAlarm *) alarmFromRegion:(CLCircularRegion *)circularRegion {
    NSArray *alarms = [[WWDataStore instance] alarms];
    NSArray *alarmFromRegion = [alarms filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"identifier = %@",@(circularRegion.identifier.integerValue)]];
    
    if (alarmFromRegion.count > 0) {
        return alarmFromRegion[0];
    }
    
    return nil;
}
@end
