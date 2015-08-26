//
//  WWAlarmFormView.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormView.h"
@interface WWAlarmFormView()
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblRadius;
@property (weak, nonatomic) IBOutlet UISlider *sldRadius;

@end
@implementation WWAlarmFormView

-(void)fillWithAlarm:(WWAlarm *)alarm {
    _lblRadius.text = [NSString stringWithFormat:@"%2fm",alarm.radius.doubleValue];
    _sldRadius.value = alarm.radius.doubleValue;
    _txtName.text = alarm.name;
}

-(void)setValuesToAlarm:(WWAlarm *)alarm {
    alarm.name = _txtName.text;
    alarm.radius = [NSNumber numberWithDouble:_sldRadius.value];
}

@end
