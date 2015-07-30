//
//  WWDataStore+Alarm.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWDataStore.h"

@interface WWDataStore (Alarm)

-(NSArray *)alarms;
-(WWAlarm *)newAlarm;
-(void)deleteAlarm:(WWAlarm *)alarm;

@end
