//
//  AppDelegate.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/26/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//
#import "WWAlarm.h"
#import "WWDataStore+Alarm.h"
#import "WWLocationManager.h"
#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    WWAlarm * alarm = [[WWDataStore instance] newAlarm];
    alarm.active = [NSNumber numberWithBool:NO];
    alarm.name = @"Alarme 1";
    alarm.radius = [NSNumber numberWithDouble:500.0];
    alarm.latitude = @(37.3322399);
    alarm.longitude = @(-122.0307759);
    alarm.identifier = @(1);
    
    [[WWLocationManager manager] startMonitoringAlarm:alarm];
    
    WWAlarm * alarm2 = [[WWDataStore instance] newAlarm];
    alarm2.active = [NSNumber numberWithBool:YES];
    alarm2.name = @"Alarme 2";
    alarm2.radius = [NSNumber numberWithDouble:250.0];
    alarm2.latitude = @(37.3998515);
    alarm2.longitude = @(-122.107459);
    alarm2.identifier = @(1);
    
    [[WWLocationManager manager] startMonitoringAlarm:alarm2];
    
    [[WWDataStore instance] saveChanges];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "BR.WakeWake" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
