//
//  NSFetchedResultsController+Factory.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/17/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import "NSFetchedResultsController+Factory.h"
#import "APMusicalInstrument.h"
#import "APInstrumentsType.h"
#import <MagicalRecord.h>

@implementation NSFetchedResultsController (Factory)

//#warning NSFetchedResultsController значительно проще создается с помощью MagicalRecord, есть группа методов вроде [APMusicalInstrument MR_fetchAll...], которая создает NSFetchedResultsController

+ (NSFetchedResultsController *)instrumentsByTypeFRCWithContext:(NSManagedObjectContext *)moc {
    return [APMusicalInstrument MR_fetchAllGroupedBy:@"type.typeName" withPredicate:nil sortedBy:@"name" ascending:NO];
}

+ (NSFetchedResultsController *)instrumentsTypesFRCWithContext:(NSManagedObjectContext *)moc {
    return [APInstrumentsType MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"typeName" ascending:NO];
}

- (NSString *)entityName {
    return @"APMusicalInstrument";
}

@end
