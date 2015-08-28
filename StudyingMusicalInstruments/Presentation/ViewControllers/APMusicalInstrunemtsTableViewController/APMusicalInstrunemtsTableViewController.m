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
#import "APMusicInstrumentsConstants.h"

@interface APMusicalInstrunemtsTableViewController () <APMusicInstrumentsDataSourceDelegate>

@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrunemtsTableViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountWithType:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentWithType:indexPath.section
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