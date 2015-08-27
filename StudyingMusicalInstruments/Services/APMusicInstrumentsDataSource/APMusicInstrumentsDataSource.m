//
//  APMusicInstrumentsDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrumentsManager.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"

const NSString *APMusicalInstrumentNameKey = @"name";
const NSString *APMusicalInstrumentDescriptionKey = @"description";
const NSString *APMusicalInstrumentTypeKey = @"type";
const NSString *APMusicalInstrumentImageKey = @"image";
const NSString *APInstrumentsPlistKey = @"instruments";
const NSString *APTypesPlistKey = @"instrument_types";
const NSInteger APMusicalInstrumentTypesCount = 4;


@interface APMusicInstrumentsDataSource ()

@property (nonatomic, strong) NSMutableArray *musicalInstrumentsByType;
@property (nonatomic, strong) NSMutableArray *musicalInstruments;
@property (nonatomic, strong) NSArray *musicalInstrumentsTypes;
@property (nonatomic, weak) IBOutlet id<APMusicInstrumentsDataSourceDelegate>delegate;

@end

@implementation APMusicInstrumentsDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        [self reloadInstruments];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(APModelDidChange)
                                                     name:modelDidChangeHandleNotificaion
                                                   object:nil];;
    }
    return self;
}

- (instancetype)initWithDelegate:(id<APMusicInstrumentsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}
- (void)dealloc {
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)reloadInstruments {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSMutableArray *tempInstrumentsByType = [[NSMutableArray alloc] init];
    NSMutableArray *tempInstruments = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < APMusicalInstrumentTypesCount; i++) {
        [tempInstrumentsByType addObject:[NSMutableArray new]];
    }
    for (NSString *musicalInstrumentKey in [dictionary[APInstrumentsPlistKey] allKeys]) {
        NSDictionary *instrumentDictionary = dictionary[APInstrumentsPlistKey][musicalInstrumentKey];
        APMusicalInstrument *newInstrument =
        [APMusicalInstrument instrumentWithName:NSLocalizedString(instrumentDictionary[APMusicalInstrumentNameKey], nil)
                                    description:NSLocalizedString(instrumentDictionary[APMusicalInstrumentDescriptionKey], nil)
                                           type:[instrumentDictionary[APMusicalInstrumentTypeKey] integerValue]
                                          image:[UIImage imageNamed:instrumentDictionary[APMusicalInstrumentImageKey]]];
        if (!newInstrument) continue;
        
        [tempInstrumentsByType[newInstrument.type] addObject:newInstrument];
        [tempInstruments addObject:newInstrument];
    }
    self.musicalInstrumentsByType = tempInstrumentsByType;
    self.musicalInstruments = tempInstruments;
    self.musicalInstrumentsTypes = dictionary[APTypesPlistKey];
    [self.delegate dataSourceIsUpdated:self];
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
    if (index >= 0 && index < self.musicalInstruments.count) {
        return self.musicalInstruments[index];
    }
    else {
        return nil;
    }
}

- (void) APModelDidChange {
    [self reloadInstruments];
}

@end
