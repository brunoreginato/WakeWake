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
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI setups
-(void)setup {
    [self setupCentralNavBarIcon];
    [self setupNavBarBackground];
    [self setupCustomBackButton];
    [self setupBackgroundImg];
}

-(void)setupCentralNavBarIcon {
    UIImage *img = [UIImage imageNamed:@"header-logo"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [imgView setImage:img];
    
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
}

-(void)setupNavBarBackground {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

-(void)setupCustomBackButton {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //removing back button text
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                             forBarMetrics:UIBarMetricsDefault];
    });
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)setupBackgroundImg {
    UIImage *bgImage = [UIImage imageNamed:@"app-bg"];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:bgImage];
    imgView.frame = [[[[UIApplication sharedApplication] delegate] window] frame];
    
    UIView *blackOverlay = [[UIView alloc] initWithFrame: imgView.frame];
    blackOverlay.layer.backgroundColor = [[UIColor blackColor] CGColor];
    blackOverlay.layer.opacity = 0.4f;
    [imgView addSubview: blackOverlay];
    
    [self.view insertSubview:imgView atIndex:0];
}


@end
