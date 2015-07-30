//
//  WWAlarmTableViewCell.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmTableViewCell.h"
@interface WWAlarmTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *radius;
@property (weak, nonatomic) IBOutlet UISwitch *active;

@end

@implementation WWAlarmTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initWithAlarm:(WWAlarm *)alarm {
    _name.text = alarm.name;
    _radius.text = [NSString stringWithFormat:@"%2fm",[alarm.radius doubleValue]];
    _active.on = alarm.active.boolValue;
}

@end
