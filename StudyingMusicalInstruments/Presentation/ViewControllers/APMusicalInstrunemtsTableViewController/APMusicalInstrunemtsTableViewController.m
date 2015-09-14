//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicInstrumentsPresentationConstants.h"
#import "APInstrumentsType.h"

@interface APMusicalInstrunemtsTableViewController () <
    /*APMusicInstrumentsDataSourceDelegate,*/
    NSFetchedResultsControllerDelegate
>

@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrunemtsTableViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountByTypeWithIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentTableCell *cell =
    [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentWithTypeIndex:indexPath.section atIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.allMusicalInstruments musicalInstrumentsTypesCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstrumentTypeNameStringAtIndex:section];
}

/*#pragma mark - APMusicInstrumentsDataSourceDelegate

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource {
    [self.tableView reloadData];
}*/

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}


@end