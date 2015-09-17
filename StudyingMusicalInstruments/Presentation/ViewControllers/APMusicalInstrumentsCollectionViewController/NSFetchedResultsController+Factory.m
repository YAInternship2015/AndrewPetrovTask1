//
//  NSFetchedResultsController+Factory.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/17/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import "NSFetchedResultsController+Factory.h"
#import <MagicalRecord.h>

@implementation NSFetchedResultsController (Factory)

- (NSFetchedResultsController *)instrumentsByTypeFRCWithContext:(NSManagedObjectContext *)moc {
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
    [NSEntityDescription  entityForName:@"APMusicalInstrument"
                 inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"name" ascending:NO];
    [fetchRequest setSortDescriptors:@[sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:moc
                                          sectionNameKeyPath:@"type.typeName"
                                                   cacheName:nil];
    fetchedResultsController = theFetchedResultsController;
    [fetchedResultsController performFetch:nil];
    
    return fetchedResultsController;
}

- (NSFetchedResultsController *)instrumentsTypesFRCWithContext:(NSManagedObjectContext *)moc {
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] init];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
    [NSEntityDescription  entityForName:@"APInstrumentsType"
                 inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:@"typeName" ascending:NO];
    [fetchRequest setSortDescriptors:@[sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:moc
                                          sectionNameKeyPath:nil
                                                   cacheName:nil];
    fetchedResultsController = theFetchedResultsController;
    [fetchedResultsController performFetch:nil];
    
    return fetchedResultsController;
}

@end
