//
//  APMusicInstrumentsTypesDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/16/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsTypesDataSource.h"
#import "APMusicalInstrumentsManager.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "APMusicalInstrumentNotifications.h"
#import "APMusicInstrumentsKeyConstants.h"
#import "APInstrumentsType.h"
#import <MagicalRecord.h>
#import "APMusicalInstrument.h"
#import <CoreData/CoreData.h>


@interface APMusicInstrumentsTypesDataSource ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation APMusicInstrumentsTypesDataSource

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
    [NSEntityDescription  entityForName:@"APInstrumentsType"
                 inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"typeName" ascending:NO];
    [fetchRequest setSortDescriptors:@[sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:context
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    _fetchedResultsController = theFetchedResultsController;
    [_fetchedResultsController performFetch:nil];
    
    return _fetchedResultsController;
}

- (NSArray *)musicalInstrumentTypes {
    [self.fetchedResultsController performFetch:nil];
    NSLog(@" musicalInstrumentTypes ++++++++++++\n%@", [self.fetchedResultsController fetchedObjects]);
    return [self.fetchedResultsController fetchedObjects];
}

@end
