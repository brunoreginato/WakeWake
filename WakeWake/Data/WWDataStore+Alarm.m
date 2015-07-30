//
//  WWDataStore+Alarm.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarm.h"
#import "WWDataStore+Alarm.h"

@implementation WWDataStore (Alarm)

static NSString * const kAlarmEntityName = @"WWAlarm";

-(NSArray *)alarms {
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:kAlarmEntityName];
    
    NSError *error = nil;
    
    NSArray *alarms = [[[WWDataStore instance] context] executeFetchRequest:req error:&error];
    
    if(!alarms) {
        NSLog(@"[WWDataStore+Alarm] Problems on retrieving data (%@)",[error localizedDescription]);
    }
    
    return alarms;
}

-(WWAlarm *)newAlarm {
    WWAlarm *alarmEntity = [NSEntityDescription insertNewObjectForEntityForName:kAlarmEntityName inManagedObjectContext:[[WWDataStore instance] context]];
    
    return alarmEntity;
}

-(void)deleteAlarm:(WWAlarm *)alarm {
    [[[WWDataStore instance] context] deleteObject:alarm];
}

@end
