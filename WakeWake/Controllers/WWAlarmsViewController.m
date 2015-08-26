//
//  WWAlarmsViewController.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWAlarmTableViewCell.h"
#import "WWAlarmsViewController.h"

@interface WWAlarmsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *alarms;
@property (strong,nonatomic) WWAlarm *alarmToForm;
@end

@implementation WWAlarmsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getAlarms];
}

-(void)viewWillAppear:(BOOL)animated {
    _alarmToForm = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate/DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _alarms.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WWAlarmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell initWithAlarm: _alarms[indexPath.row]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"alarmForm"]) {
        WWAlarmFormViewController *formAlarm = (WWAlarmFormViewController *)segue.destinationViewController;
        [formAlarm initWithAlarm: _alarmToForm];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     _alarmToForm = _alarms[indexPath.row];
    
    [self performSegueWithIdentifier:@"alarmForm" sender:nil];
}

- (IBAction)addAlarm:(id)sender {
    _alarmToForm = [[WWDataStore instance] newAlarm];
    
    [self performSegueWithIdentifier:@"alarmForm" sender:nil];
}

#pragma mark - WWDataSource+Alarm
-(void) getAlarms {
    _alarms = [[WWDataStore instance] alarms];
    
    [_tableView reloadData];
}
@end
