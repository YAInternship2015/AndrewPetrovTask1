//
//  NSFetchedResultsController+Factory.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/17/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (Factory)

- (NSFetchedResultsController *)instrumentsByTypeFRCWithContext:(NSManagedObjectContext *)moc;
- (NSFetchedResultsController *)instrumentsTypesFRCWithContext:(NSManagedObjectContext *)moc;

@end