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
#import "APMusicalInstrument.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrunemtsNavigationController.h"

@interface APMusicalInstrunemtsTableViewController ()

@property (nonatomic, strong) APMusicInstrumentsDataSource *allMusicalInstruments;
@property (nonatomic, weak) id<APMusicalInstrunemtsTableViewControllerDelegate> delegate;

@end

@implementation APMusicalInstrunemtsTableViewController


- (instancetype)initWithStyle:(UITableViewStyle)style
                     delegate:(id<APMusicalInstrunemtsTableViewControllerDelegate>)delegate {
    self = [super initWithStyle:style];
    if (self) {
        self.delegate = delegate;
    }
    NSLog(@"APMusicalInstrunemtsTableViewController init");
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allMusicalInstruments = [[APMusicInstrumentsDataSource alloc]initWithDelegate:self];
}

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

- (void)dataSourceIsUpdated {
    [self.tableView reloadData];
}


@end