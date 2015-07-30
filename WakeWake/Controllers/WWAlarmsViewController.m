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
@property (weak, nonatomic) NSArray *alarms;
@end

@implementation WWAlarmsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getAlarms];
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

#pragma mark - WWDataSource+Alarm
-(void) getAlarms {
    _alarms = [[WWDataStore instance] alarms];
    
    [_tableView reloadData];
}
@end
