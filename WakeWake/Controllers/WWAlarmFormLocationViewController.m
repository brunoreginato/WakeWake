//
//  WWAlarmFormLocationViewController.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormLocationViewController.h"

@interface WWAlarmFormLocationViewController ()
@property (weak,nonatomic) WWAlarm *alarm;
@end

@implementation WWAlarmFormLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWithAlarm:(WWAlarm *)alarm {
    _alarm = alarm;
}

@end
