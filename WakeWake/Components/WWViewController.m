//
//  WWViewController.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 11/1/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWViewController.h"

@interface WWViewController ()

@end

@implementation WWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [UIImage imageNamed:@"header-logo"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imgView setImage:img];
    
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
