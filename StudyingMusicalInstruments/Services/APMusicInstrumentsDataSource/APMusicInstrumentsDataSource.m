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
#import "APMusicInstrumentsConstants.h"
#import "APMusicalInstrumentNotifications.h"

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
                                                 selector:@selector(modelDidChange)
                                                     name:APModelDidChangeNotificaion
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
    if(![NSFileManager isInstrumentsPlistExist]) {
        [APMusicalInstrumentsManager restoreInstrumentPlist];
    }
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.musicalInstrumentsTypes = dictionary[APTypesPlistKey];
    NSMutableArray *tempInstrumentsByType = [[NSMutableArray alloc] init];
    NSMutableArray *tempInstruments = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.musicalInstrumentsTypes.count; i++) {
        [tempInstrumentsByType addObject:[NSMutableArray new]];
    }
    for (NSString *musicalInstrumentKey in [dictionary[APInstrumentsPlistKey] allKeys]) {
        NSDictionary *instrumentDictionary = dictionary[APInstrumentsPlistKey][musicalInstrumentKey];
        APMusicalInstrument *newInstrument =
        [APMusicalInstrument instrumentWithName:NSLocalizedString(instrumentDictionary[APMusicalInstrumentNameKey], nil)
                                    description:NSLocalizedString(instrumentDictionary[APMusicalInstrumentDescriptionKey], nil)
                                           type:[instrumentDictionary[APMusicalInstrumentTypeKey] integerValue]
                                          imageName:instrumentDictionary[APMusicalInstrumentImageKey]];
        if (!newInstrument) continue;
        
        [tempInstrumentsByType[newInstrument.type] addObject:newInstrument];
        [tempInstruments addObject:newInstrument];
    }
    self.musicalInstrumentsByType = tempInstrumentsByType;
    self.musicalInstruments = tempInstruments;
    
    if (self.delegate) {
        [self.delegate dataSourceIsUpdated:self];
    }
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
    return nil;
}

- (void) modelDidChange {
    [self reloadInstruments];
}

@end
