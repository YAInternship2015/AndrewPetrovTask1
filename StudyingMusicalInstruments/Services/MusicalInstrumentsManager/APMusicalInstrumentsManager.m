//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "NSString+APMusicalInstrumentsManager.h"

const NSString *APMusicalInstrumentNameKey = @"name";
const NSString *APMusicalInstrumentDescriptionKey = @"description";
const NSString *APMusicalInstrumentTypeKey = @"type";
const NSString *APMusicalInstrumentImageKey = @"image";
const NSInteger APMusicalInstrumentTypesCount = 4;

@interface APMusicalInstrumentsManager ()

@property (nonatomic, strong) NSMutableArray *musicalInstrumentsByType;
@property (nonatomic, strong) NSMutableArray *musicalInstruments;
@property (nonatomic, strong) NSArray *musicalInstrumentsTypes;

@end

@implementation APMusicalInstrumentsManager

+ (NSDictionary *)instrumentsPlistContent {
    NSString *plistPath = [NSString instrumentsPlistPath];
    NSLog(@"%@", plistPath);
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dictionary;
}

+ (APMusicalInstrumentsManager *)managerWithBasicSetOfInstruments {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSMutableArray *tempInstrumentsByType = [[NSMutableArray alloc] init];
    NSMutableArray *tempInstruments = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < APMusicalInstrumentTypesCount; i++) {
        [tempInstrumentsByType addObject:[NSMutableArray new]];
    }
    for (NSString *musicalInstrumentKey in [dictionary[@"instruments"] allKeys]) {
        NSDictionary *instrumentDictionary = dictionary[@"instruments"][musicalInstrumentKey];
        APMusicalInstrument *newInstrument =
        [APMusicalInstrument instrumentWithName:NSLocalizedString(instrumentDictionary[APMusicalInstrumentNameKey], nil)
                                    description:NSLocalizedString(instrumentDictionary[APMusicalInstrumentDescriptionKey], nil)
                                           type:[instrumentDictionary[APMusicalInstrumentTypeKey] integerValue]
                                          image:[UIImage imageNamed:instrumentDictionary[APMusicalInstrumentImageKey]]];
        if (!newInstrument) continue;
        
        [tempInstrumentsByType[newInstrument.type] addObject:newInstrument];
        [tempInstruments addObject:newInstrument];
    }
    APMusicalInstrumentsManager *allMusicalInstruments = [[APMusicalInstrumentsManager alloc] init];
    
    allMusicalInstruments.musicalInstrumentsByType = tempInstrumentsByType;
    allMusicalInstruments.musicalInstruments = tempInstruments;
    allMusicalInstruments.musicalInstrumentsTypes = dictionary[@"instrument_types"];
    
    return allMusicalInstruments;
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

}

+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    
    NSDictionary *instrumentDictionary = @{
                                           @"name": instrument.name,
                                           @"description": instrument.instrumentDescription,
                                           @"type": @(instrument.type),
                                           @"image": (instrument.instrumentImage ? instrument.name : @"")
                                           };
    /*NSMutableDictionary *tempDictionary = (NSMutableDictionary *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)[self instrumentsPlistContent], kCFPropertyListMutableContainers);*/
    
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    NSDictionary *oldDictionary = [self instrumentsPlistContent];
    
    for (NSString *key in [oldDictionary allKeys]) {
        [tempDictionary setObject:[oldDictionary[key]mutableCopy] forKey:key];
    }
    [tempDictionary[@"instruments"] setObject:instrumentDictionary forKey:instrument.name];
//    [tempDictionary[@"instruments"] addObject:instrumentDictionary];
    
    /*NSMutableArray* originalArray;
    NSMutableArray* newArray;
    
    newArray = (NSMutableArray*)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (CFPropertyListRef)originalArray, kCFPropertyListMutableContainers);*/
    
    if ([tempDictionary writeToFile:[NSString instrumentsPlistPath] atomically:YES])
        NSLog(@"file updated");
    else
        NSLog(@"file not updated");
}

- (NSInteger)musicalInstrumentsTypesCount {
    return self.musicalInstrumentsByType.count;
}

- (NSInteger)musicalInstrumentsCountWithType:(APInstrumentsType)type {
    if (type < 0 || type >= [self musicalInstrumentsTypesCount]) {
        return 0;
    }
    return ((NSMutableArray *)self.musicalInstrumentsByType[type]).count;
}

- (APMusicalInstrument *)musicalInstrumentWithType:(APInstrumentsType)type atIndex:(NSInteger)index {
    return (APMusicalInstrument *)(((NSMutableArray *)self.musicalInstrumentsByType[type])[index]);
}

- (NSString *)musicalInstrumentTypeNameStringAtIndex:(NSInteger)index {
    return NSLocalizedString((NSString *)self.musicalInstrumentsTypes[index], nil);
}

- (NSInteger)musicalInstrumentsCount {
    return self.musicalInstruments.count;
}
- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index {
    return self.musicalInstruments[index];
}


@end
