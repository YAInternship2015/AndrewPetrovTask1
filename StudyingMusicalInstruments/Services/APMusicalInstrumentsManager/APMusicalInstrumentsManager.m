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

NSString * const APModelDidChangeNotificaion = @"APModelDidChangeNotificaion";

@interface NSDictionary (APMusicalInstrumentsManager)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument;

@end

@implementation NSDictionary (APMusicalInstrumentsManager)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = @{
                                           @"name": instrument.name,
                                           @"description": instrument.instrumentDescription,
                                           @"type": @(instrument.type),
                                           @"image": instrument.imageName ? instrument.imageName : @""
                                           };
    return instrumentDictionary;
}

@end

@implementation APMusicalInstrumentsManager

+ (NSDictionary *)instrumentsPlistContent {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dictionary;
}

+ (void)restoreInstrumentPlist {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSFileManager instrumentsPlistPath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    NSError *error = nil;
    if(fileExists) {
        [fileManager removeItemAtPath:docPath error:&error];
    }
    NSString *strSourcePath = [NSFileManager sourceInstrumentsPlistPath];
    [fileManager copyItemAtPath:strSourcePath toPath:docPath error:&error];
}

+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = [NSDictionary dictionaryWithInstrument:instrument];
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    NSDictionary *oldDictionary = [self instrumentsPlistContent];
    
    for (NSString *key in [oldDictionary allKeys]) {
        [tempDictionary setObject:[oldDictionary[key]mutableCopy] forKey:key];
    }
    [tempDictionary[APInstrumentsPlistKey] setObject:instrumentDictionary forKey:instrument.name];
    
    
    if(![NSFileManager isInstrumentsPlistExist]) {
        [self restoreInstrumentPlist];
    }

    if ([tempDictionary writeToFile:[NSFileManager instrumentsPlistPath] atomically:YES]) {
        NSLog(@"file updated");
        [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotificaion object:nil];
    }
    else
        NSLog(@"file not updated");
}

@end
