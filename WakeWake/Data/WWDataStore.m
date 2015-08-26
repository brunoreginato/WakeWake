//
//  WWDataStore.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 7/27/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "WWDataStore.h"

@interface WWDataStore()
    @property NSManagedObjectModel *model;
@end

@implementation WWDataStore

+(instancetype) instance {
    static WWDataStore *instace = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instace = [[self alloc] init];
    });
    
    return instace;
}

-(id)init {
    self = [super init];
    
    //getting all merged models from this app's bundle
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    
    //creating the .sqlite file
    NSURL *dataStoreUrl = [[(AppDelegate *)[[UIApplication sharedApplication] delegate] applicationDocumentsDirectory] URLByAppendingPathComponent:@"WakeWake.sqlite"];
    
    //cleaning the datasstore
    [[NSFileManager defaultManager] removeItemAtURL:dataStoreUrl error:nil];
    
    NSError *error = nil;
    if(![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dataStoreUrl options:nil error:&error]) {
        
        NSLog(@"[WWDataStore] Problems on creating the persistentStore: (%@)", [error localizedDescription]);
    }
    
    //context
    _context = [[NSManagedObjectContext alloc] init];
    [_context setPersistentStoreCoordinator:psc];
    
    return self;
}

-(BOOL)saveChanges {
    NSError *error = nil;
    
    if(![_context save:&error]) {
        NSLog(@"[WWDataStore] Problems on saving data to the store: (%@)", [error localizedDescription]);
    }
    
    return error != nil;
}

-(void)discartChanges {
    [_context undo];
}

@end
