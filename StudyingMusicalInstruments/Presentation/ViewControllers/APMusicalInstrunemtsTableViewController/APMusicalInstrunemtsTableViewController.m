//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrunemtsNavigationController.h"

@interface APMusicalInstrunemtsTableViewController ()

@property (nonatomic, strong) APMusicInstrumentsDataSource *allMusicalInstruments;
@property (nonatomic, weak) id<APMusicalInstrunemtsTableViewControllerDelegate> delegate;

@end

@implementation APMusicalInstrunemtsTableViewController

- (instancetype)initWithDelegate:(id<APMusicalInstrunemtsTableViewControllerDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allMusicalInstruments = [[APMusicInstrumentsDataSource alloc]initWithDelegate:self];
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    UIBarButtonItem* addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self.delegate
                                                   action:@selector(addNewInstrument:)];
    UIBarButtonItem* setCollectionViewButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                   target:self.delegate
                                                   action:@selector(setCollectionView:)];
    self.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, setCollectionViewButtonItem];
    
    APMusicalInstrument *instrunent = [APMusicalInstrument instrumentWithName:@"aaa" description:@"bbb" type:1 image:nil];
    [APMusicalInstrumentsManager saveInstrument:instrunent];
    APMusicalInstrument *instrunent2 = [APMusicalInstrument instrumentWithName:@"aaa2" description:@"bbb2" type:1 image:nil];
    [APMusicalInstrumentsManager saveInstrument:instrunent2];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountWithType:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
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