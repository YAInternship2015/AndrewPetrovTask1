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

@interface APMusicalInstrunemtsTableViewController () <APMusicInstrumentsDataSourceDelegate>

@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;
//@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation APMusicalInstrunemtsTableViewController

//- (void)viewDidUnload {
//    self.fetchedResultsController = nil;
//}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountWithType:[APInstrumentsType typeWithNumber:section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentWithType:[APInstrumentsType typeWithNumber:indexPath.section]
                                                                     atIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.allMusicalInstruments musicalInstrumentsTypesCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstrumentTypeNameStringAtIndex:section];
}

#pragma mark - APMusicInstrumentsDataSourceDelegate

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource {
    [self.tableView reloadData];
}

@end