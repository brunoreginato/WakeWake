//
//  WWAlarmTableViewCell.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmTableViewCell.h"
#import "UIColor+WWColor.h"

@interface WWAlarmTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *radius;
@property (weak, nonatomic) IBOutlet UISwitch *active;
@property (weak,nonatomic) NSIndexPath *indexPath;
@end

@implementation WWAlarmTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initWithAlarm:(WWAlarm *)alarm andIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    _name.text = alarm.name;
    _radius.text = [NSString stringWithFormat:@"%dm",[alarm.radius integerValue]];
    _active.on = alarm.active.boolValue;
    
    [self setupBackgroudColor];
}

-(void)setupBackgroudColor {
    UIColor *bgColor;
    
    if(_indexPath.row %2 == 0){
        bgColor = [UIColor WWpurple];
    } else {
        NSInteger randomNumber = arc4random() % 3;
        
        if(randomNumber == 1) {
            bgColor = [UIColor WWlightPurple];
        } else {
            bgColor = [UIColor WWdarkPurple];
        }
    }
    
    [self.contentView setBackgroundColor:bgColor];
}

@end
