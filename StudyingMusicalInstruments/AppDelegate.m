//
//  AppDelegate.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <MagicalRecord.h>
#import "APMusicalInstrumentsManager.h"

@interface AppDelegate () 

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    [APMusicalInstrumentsManager addInstrumentTypesIfNeeded];
    
    return YES;
}

- (NSURL *)applicationDocumentsDirectory {
       return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end