//
//  WWAlarmTableViewCell.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmTableViewCell.h"
#import "UIColor+WWColor.h"
#import "UIFont+WWFont.h"

@interface WWAlarmTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *radius;

@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *statusOnLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusOffLabel;

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
    
    [self setupStatusLabelForAlarm:alarm];
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

-(void) setupStatusLabelForAlarm:(WWAlarm *)alarm {
    bool isActive = alarm.active.boolValue;
    
    if (isActive) {
        _statusImage.image = [UIImage imageNamed:@"bell-on"];
        
        [_statusOffLabel setFont: [UIFont WWsmallFontSize]];
        [_statusOffLabel setTextColor:[UIColor whiteColor]];
        
        [_statusOnLabel setFont: [UIFont WWsmallFontBold]];
        [_statusOnLabel setTextColor:[UIColor WWaqua]];
        
    } else {
        _statusImage.image = [UIImage imageNamed:@"bell-off"];
        
        [_statusOffLabel setFont: [UIFont WWsmallFontBold]];
        [_statusOffLabel setTextColor:[UIColor WWPink]];
        
        [_statusOnLabel setFont: [UIFont WWsmallFontSize]];
        [_statusOnLabel setTextColor:[UIColor whiteColor]];
    }
    
}

@end
