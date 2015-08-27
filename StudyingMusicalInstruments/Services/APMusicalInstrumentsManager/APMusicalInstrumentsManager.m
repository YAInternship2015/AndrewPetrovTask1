//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"

NSString* const modelDidChangeHandleNotificaion = @"APModelDidChangeNotification";

@interface NSDictionary (APMusicalInstrumentsManager)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument;

@end

@implementation NSDictionary (APMusicalInstrumentsManager)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = @{
                                           @"name": instrument.name,
                                           @"description": instrument.instrumentDescription,
                                           @"type": @(instrument.type),
                                           //TODO: subclass ftom uiimage with property name
                                           @"image": @""
                                           };
    return instrumentDictionary;
}

@end


@interface APMusicalInstrumentsManager ()

@end

@implementation APMusicalInstrumentsManager

+ (NSDictionary *)instrumentsPlistContent {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dictionary;
}

+ (void)restoreInstrumentPlistToDocuements {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSFileManager instrumentsPlistPath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    NSError *error = nil;
    if(fileExists) {
        [fileManager removeItemAtPath:docPath error:&error];
    }
    NSString *strSourcePath = [NSFileManager sourceInstrumentsPlistPath];
    [fileManager copyItemAtPath:strSourcePath toPath:docPath error:&error];
    [[NSNotificationCenter defaultCenter] postNotificationName: modelDidChangeHandleNotificaion object:nil];
}

+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = [NSDictionary dictionaryWithInstrument:instrument];
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    NSDictionary *oldDictionary = [self instrumentsPlistContent];
    
    for (NSString *key in [oldDictionary allKeys]) {
        [tempDictionary setObject:[oldDictionary[key]mutableCopy] forKey:key];
    }
    [tempDictionary[APInstrumentsPlistKey] setObject:instrumentDictionary forKey:instrument.name];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSFileManager instrumentsPlistPath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    if(!fileExists) {
        [self restoreInstrumentPlistToDocuements];
    }

    if ([tempDictionary writeToFile:[NSFileManager instrumentsPlistPath] atomically:YES]) {
        NSLog(@"file updated");
        [[NSNotificationCenter defaultCenter] postNotificationName: modelDidChangeHandleNotificaion object:nil];
    }
    else
        NSLog(@"file not updated");
}

@end
