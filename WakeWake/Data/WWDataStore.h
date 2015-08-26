//
//  WWDataStore.h
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface WWDataStore : NSObject

@property (strong,nonatomic) NSManagedObjectContext *context;

+(instancetype) instance;
-(BOOL) saveChanges;
-(void)discartChanges;

@end
