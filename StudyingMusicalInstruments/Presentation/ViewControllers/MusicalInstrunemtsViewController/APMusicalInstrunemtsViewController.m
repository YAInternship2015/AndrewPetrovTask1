//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrunemtsViewController.h"
#import "APMusicalInstrumentCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "APMusicInstrumentsDataSource.h"


@interface APMusicalInstrunemtsViewController ()

@property (nonatomic, strong) APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrunemtsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allMusicalInstruments = [APMusicInstrumentsDataSource new];
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    APMusicalInstrument *instrunent = [APMusicalInstrument instrumentWithName:@"aaa" description:@"bbb" type:1 image:nil];
    [APMusicalInstrumentsManager saveInstrument:instrunent];
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

@end