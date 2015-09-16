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

@end

@implementation APMusicalInstrunemtsTableViewController

-(void)dealloc {
    NSLog(@"---------------APMusicalInstrunemtsTableViewController deallocated");
}

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
    return [self.allMusicalInstruments musicalInstrumentTypes].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstrumentTypeNameStringAtIndex:section];
}

- (void)configureCell:(APMusicalInstrumentTableCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    APMusicalInstrument *musicalInstrument = [self.allMusicalInstruments musicalInstruments][indexPath.row];
    [cell setInstrument:musicalInstrument];
}

#pragma mark - APMusicInstrumentsDataSourceDelegate

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource {
    [self.tableView reloadData];
}

@end