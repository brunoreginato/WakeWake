//
//  WWAlarmFormViewController.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormLocationViewController.h"
#import "WWAlarm.h"
#import <UIKit/UIKit.h>
#import "WWViewController.h"

@interface WWAlarmFormViewController : WWViewController

-(void)initWithAlarm:(WWAlarm *)alarm;

@end
