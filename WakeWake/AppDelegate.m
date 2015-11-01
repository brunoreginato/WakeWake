//
//  AppDelegate.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/26/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//
#import "WWAlarm.h"
//#import "WWDataStore.h"
#import "WWDataStore+Alarm.h"
#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong,nonatomic) CLLocationManager *locationManager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    if ([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [_locationManager requestAlwaysAuthorization];
    }
    
    // Override point for customization after application launch.
    
    WWAlarm * alarm = [[WWDataStore instance] newAlarm];
    alarm.active = [NSNumber numberWithBool:NO];
    alarm.name = @"Alarme 1";
    alarm.radius = [NSNumber numberWithDouble:500.0];
    
    WWAlarm * alarm2 = [[WWDataStore instance] newAlarm];
    alarm2.active = [NSNumber numberWithBool:YES];
    alarm2.name = @"Alarme 2";
    alarm2.radius = [NSNumber numberWithDouble:250.0];
    
    [[WWDataStore instance] saveChanges];
    
    [self setupNavigationBarStyle];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [_locationManager startMonitoringSignificantLocationChanges];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [_locationManager stopMonitoringSignificantLocationChanges];
    [_locationManager startUpdatingLocation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "BR.WakeWake" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma  mark - CLLocationManagerDelegate
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location updated!");
}

#pragma mark - NavigationBarStyle 
-(void)setupNavigationBarStyle {
    UIImage *bg = [[UIImage imageNamed:@"app-bg"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
    
    [[UINavigationBar appearance] setBackgroundImage:bg
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
}
@end
