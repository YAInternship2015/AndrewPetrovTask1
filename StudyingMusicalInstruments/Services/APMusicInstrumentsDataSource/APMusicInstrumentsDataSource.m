//
//  APMusicInstrumentsDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicInstrumentsDataSource.h"
#import <MagicalRecord.h>
#import "NSFetchedResultsController+Factory.h"

@interface APMusicInstrumentsDataSource ()

@property (nonatomic, strong) NSMutableArray *musicalInstrumentsByType;
@property (nonatomic, strong) NSMutableArray *musicalInstruments;
@property (nonatomic, strong) NSArray *musicalInstrumentsTypes;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) IBOutlet id<APMusicInstrumentsDataSourceDelegate>delegate;

@end

@implementation APMusicInstrumentsDataSource

- (instancetype)initWithDelegate:(id<APMusicInstrumentsDataSourceDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        _fetchedResultsController = [NSFetchedResultsController instrumentsByTypeFRCWithContext:[NSManagedObjectContext MR_defaultContext]];
        _fetchedResultsController.delegate = self;
        [_fetchedResultsController performFetch:nil];
    }
    return _fetchedResultsController;
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

- (NSString *)musicalInstrumentTypeNameAtIndex:(NSInteger)index {
    return ((id <NSFetchedResultsSectionInfo>)[self.fetchedResultsController sections][index]).name;
}

- (NSArray *)musicalInstruments {
    return [self.fetchedResultsController fetchedObjects];
}

- (NSInteger)musicalInstrumentTypesCount {
    return [self.fetchedResultsController sections].count;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.delegate dataSourceIsUpdated:self];
}

@end