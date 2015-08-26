//
//  WWAlarmFormViewController.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 8/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmFormViewController.h"
#import "WWAlarmFormView.h"
#import "WWAlarmFormLocationViewController.h"
#import "WWDataStore+Alarm.h"

@interface WWAlarmFormViewController ()
    @property (weak,nonatomic) WWAlarm *alarm;
@end

@implementation WWAlarmFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainView fillWithAlarm:_alarm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initWithAlarm:(WWAlarm *)alarm {
    _alarm = alarm;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"alarmLocationForm"]) {
        WWAlarmFormLocationViewController *formLocation = (WWAlarmFormLocationViewController *) segue.destinationViewController;
        [formLocation initWithAlarm:_alarm];
    }
}

- (IBAction)next:(id)sender {
    [self.mainView setValuesToAlarm:_alarm];
    [[WWDataStore instance] saveChanges];
    
    [self performSegueWithIdentifier:@"alarmLocationForm" sender:nil];
}

#pragma mark - MainViewParser
-(WWAlarmFormView *)mainView {
    return (WWAlarmFormView *)self.view;
}
@end
