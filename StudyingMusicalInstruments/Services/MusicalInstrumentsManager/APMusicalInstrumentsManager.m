//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
//TODO: add notification
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "NSString+APMusicalInstrumentsManager.h"

NSString* const APModelDidChangeNotification = @"APModelDidChangeNotification";

@interface APMusicalInstrumentsManager ()

@end

@implementation APMusicalInstrumentsManager

+ (NSDictionary *)instrumentsPlistContent {
    NSString *plistPath = [NSString instrumentsPlistPath];
    NSLog(@"%@", plistPath);
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dictionary;
}

+ (void)copyInstrumentPlistToMainBundle {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSString instrumentsPlistPath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    NSError *error = nil;
    if(fileExists) {
        [fileManager removeItemAtPath:docPath error:&error];
    }
    NSString *strSourcePath = [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
    [fileManager copyItemAtPath:strSourcePath toPath:docPath error:&error];
    [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotification object:nil];
}

+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = @{
                                           @"name": instrument.name,
                                           @"description": instrument.instrumentDescription,
                                           @"type": @(instrument.type),
                                           @"image": (instrument.instrumentImage ? instrument.name : @"sellStubImage")
                                           };
    /*NSMutableArray* originalArray;
     NSMutableArray* newArray;
     
     newArray = (NSMutableArray*)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)originalArray, kCFPropertyListMutableContainers);*/
    /*NSMutableDictionary *tempDictionary = (NSMutableDictionary *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)[self instrumentsPlistContent], kCFPropertyListMutableContainers);*/
    
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    NSDictionary *oldDictionary = [self instrumentsPlistContent];
    
    for (NSString *key in [oldDictionary allKeys]) {
        [tempDictionary setObject:[oldDictionary[key]mutableCopy] forKey:key];
    }
    [tempDictionary[@"instruments"] setObject:instrumentDictionary forKey:instrument.name];
    if ([tempDictionary writeToFile:[NSString instrumentsPlistPath] atomically:YES])
        NSLog(@"file updated");
    else
        NSLog(@"file not updated");
    [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotification object:nil];
}

@end
