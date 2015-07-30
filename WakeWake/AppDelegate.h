//
//  AppDelegate.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/26/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@import CoreLocation;

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSURL *)applicationDocumentsDirectory;


@end

