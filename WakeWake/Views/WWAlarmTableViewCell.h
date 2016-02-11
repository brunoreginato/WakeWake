//
//  WWAlarmTableViewCell.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//
#import "WWAlarm.h"
#import <UIKit/UIKit.h>

@protocol WWAlarmTableViewCellDelegate <NSObject>
-(void)didTapActiveAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface WWAlarmTableViewCell : UITableViewCell

@property (weak,nonatomic) id<WWAlarmTableViewCellDelegate> delegate;
-(void)initWithAlarm:(WWAlarm *)alarm andIndexPath:(NSIndexPath *)indexPath;

@end
