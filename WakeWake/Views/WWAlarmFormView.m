//
//  WWAlarmFormView.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormView.h"
#import "UIColor+WWColor.h"

@interface WWAlarmFormView()
@property (weak, nonatomic) IBOutlet UITextField *txtName;

@property (weak, nonatomic) IBOutlet UISlider *sldRadius;

@property (weak, nonatomic) IBOutlet UIView *radiusView;
@property (weak, nonatomic) IBOutlet UIView *radiusContainerView;
@property (weak, nonatomic) IBOutlet UILabel *lblUnity;
@property (weak, nonatomic) IBOutlet UILabel *lblRadius;


@end
@implementation WWAlarmFormView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    [self setupRadiusView];
    [self setupSliderRadius];
}

-(void)fillWithAlarm:(WWAlarm *)alarm {
    _lblRadius.text = [NSString stringWithFormat:@"%d",alarm.radius.integerValue];
    [_sldRadius setValue:alarm.radius.doubleValue animated:YES];
    _txtName.text = alarm.name;
}

-(void)setValuesToAlarm:(WWAlarm *)alarm {
    alarm.name = _txtName.text;
    alarm.radius = [NSNumber numberWithDouble:_sldRadius.value];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    NSNumber *radius = [NSNumber numberWithFloat:_sldRadius.value];
    _lblRadius.text = [NSString stringWithFormat:@"%d",radius.integerValue];
}

#pragma mark - RadiusView UI setups
-(void)setupRadiusView {
    _radiusView.backgroundColor = [UIColor clearColor];
    
    _radiusView.layer.borderColor = [UIColor whiteColor].CGColor;
    _radiusView.layer.borderWidth = 1.0f;
    _radiusView.layer.masksToBounds = YES;
    _radiusView.layer.cornerRadius = _radiusView.frame.size.height/2;
    
    _radiusContainerView.layer.masksToBounds = YES;
    _radiusContainerView.layer.cornerRadius = _radiusContainerView.frame.size.height/2;
}

#pragma mark - SliderRadius UI setups
-(void)setupSliderRadius {
    [_sldRadius addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [_sldRadius setThumbImage:[_sldRadius thumbImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    _sldRadius.thumbTintColor = [UIColor WWaqua];
}

@end
