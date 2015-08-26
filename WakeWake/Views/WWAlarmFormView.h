//
//  WWAlarmFormView.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWAlarm.h"

@interface WWAlarmFormView : UIView

-(void)fillWithAlarm:(WWAlarm *)alarm;
-(void)setValuesToAlarm:(WWAlarm *)alarm;

@end
