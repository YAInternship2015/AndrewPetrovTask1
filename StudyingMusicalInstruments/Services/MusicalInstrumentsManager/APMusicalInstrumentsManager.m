//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

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
