//
//  APMusicInstrumentsTypesDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/16/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsTypesDataSource.h"
#import <MagicalRecord.h>
#import "NSFetchedResultsController+Factory.h"

@interface APMusicInstrumentsTypesDataSource () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation APMusicInstrumentsTypesDataSource

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    _fetchedResultsController = [NSFetchedResultsController
                                 instrumentsTypesFRCWithContext:[NSManagedObjectContext MR_defaultContext]];
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

- (NSArray *)musicalInstrumentTypes {
    return [self.fetchedResultsController fetchedObjects];
}

@end
