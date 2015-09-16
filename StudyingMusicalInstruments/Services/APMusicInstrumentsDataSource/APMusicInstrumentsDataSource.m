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
#import "APMusicalInstrumentNotifications.h"
#import "APMusicInstrumentsKeyConstants.h"
#import "APInstrumentsType.h"
#import <MagicalRecord.h>
#import "APMusicalInstrument.h"
#import <CoreData/CoreData.h>

@interface APMusicInstrumentsDataSource ()

@property (nonatomic, strong) NSMutableArray *musicalInstrumentsByType;
@property (nonatomic, strong) NSMutableArray *musicalInstruments;
@property (nonatomic, strong) NSArray *musicalInstrumentsTypes;
//@property (nonatomic, weak) IBOutlet id<APMusicInstrumentsDataSourceDelegate>delegate;
@property (nonatomic, weak) IBOutlet id<NSFetchedResultsControllerDelegate>fetchedResultsControllerdelegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation APMusicInstrumentsDataSource

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
//        [self.fetchedResultsController performFetch:nil];
    }
    return self;
}

/*- (instancetype)initWithDelegate:(id<APMusicInstrumentsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}*/

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
    [NSEntityDescription  entityForName:@"APMusicalInstrument"
                 inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"name" ascending:NO];
    [fetchRequest setSortDescriptors:@[sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:context sectionNameKeyPath:@"type.typeName"
                                                   cacheName:@"Root"];
    _fetchedResultsController = theFetchedResultsController;
    [_fetchedResultsController performFetch:nil];
    
    return _fetchedResultsController;
}

- (void)reloadInstruments {
    /*if(![NSFileManager isInstrumentsPlistExist]) {
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
    }*/
}

- (NSInteger)musicalInstrumentsTypesCount {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)musicalInstrumentsCountByTypeWithIndex:(NSInteger)index {
    id <NSFetchedResultsSectionInfo> sectionInfo =
    [[_fetchedResultsController sections] objectAtIndex:index];
    return [sectionInfo numberOfObjects];

}

- (APMusicalInstrument *)musicalInstrumentWithTypeIndex:(NSInteger)typeIndex
                                                atIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:typeIndex];
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (NSString *)musicalInstrumentTypeNameStringAtIndex:(NSInteger)index {
    return ((id <NSFetchedResultsSectionInfo>)[self.fetchedResultsController sections][index]).name;
}

- (NSInteger)musicalInstrumentsCount {
    NSLog(@"musicalInstruments\n==========\n%@", [self.fetchedResultsController fetchedObjects]);
    return [self.fetchedResultsController fetchedObjects].count;
}

- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.musicalInstruments.count) {
        return [self.fetchedResultsController fetchedObjects][index];
    }
    return nil;
}

- (void) modelDidChange {
    [self reloadInstruments];
}

@end