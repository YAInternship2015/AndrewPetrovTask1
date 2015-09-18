//
//  APMusicInstrumentsTableViewDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/17/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsTableViewDataSource.h"
#import "APMusicalInstrumentTableCell.h"

@implementation APMusicInstrumentsTableViewDataSource

- (void)configureCell:(APMusicalInstrumentTableCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    APMusicalInstrument *musicalInstrument = [self musicalInstrumentWithTypeIndex:indexPath.section
                                                                          atIndex:indexPath.row];
    [cell setInstrument:musicalInstrument];
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject atIndexPath:(nullable NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(nullable NSIndexPath *)newIndexPath {
    
//    if ([super respondsToSelector:@selector(controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:)]){
//        [super controller:controller didChangeObject:anObject atIndexPath:indexPath forChangeType:type newIndexPath:newIndexPath];
//    }
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
    
//    if ([super respondsToSelector:@selector(controller:didChangeSection:atIndex:forChangeType:)]){
//        [super controller:controller didChangeSection:sectionInfo atIndex:sectionIndex forChangeType:type];
//    }
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex]
                          withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
//    if ([super respondsToSelector:@selector(controllerWillChangeContent:)]){
//        [super controllerWillChangeContent:controller];
//    }
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
//    if ([super respondsToSelector:@selector(controllerDidChangeContent:)]){
//        [super controllerDidChangeContent:controller];
//    }
    [self.tableView endUpdates];
}

@end
