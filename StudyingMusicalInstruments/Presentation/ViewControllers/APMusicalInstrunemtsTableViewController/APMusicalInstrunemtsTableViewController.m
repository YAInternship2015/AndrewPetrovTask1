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

@interface APMusicalInstrunemtsTableViewController ()

@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrunemtsTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountByTypeWithIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentTableCell *cell =
    [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments
                         musicalInstrumentWithTypeIndex:indexPath.section atIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.allMusicalInstruments musicalInstrumentTypesCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return NSLocalizedString([self.allMusicalInstruments musicalInstrumentTypeNameAtIndex:section], nil);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [APMusicalInstrumentsManager deleteInstrument:[self.allMusicalInstruments
                                                       musicalInstrumentWithTypeIndex:indexPath.section                                              atIndex:indexPath.row]];
    }
}

@end