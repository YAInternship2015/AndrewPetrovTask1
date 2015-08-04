//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APTableViewController.h"
#import "APTableViewCell.h"
#import "APAllMusicalInstruments.h"
#import "APMusicalInstrument.h"
//#import <Foundation/Foundation.h>
@import Foundation;

@interface APTableViewController ()

@property (strong, nonatomic) APAllMusicalInstruments* allMusicalInstruments;

@end

@implementation APTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"allMusicalInstruments initWithCoder");
        [self initPrepearing];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
//    no one of ancestors has method initWithFrame
//    self = [super initWithFrame:frame];
    self = [super init];
    if (self) {
        NSLog(@"allMusicalInstruments initWithFrame");
        [self initPrepearing];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"allMusicalInstruments initWithStyle");
        [self initPrepearing];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.allMusicalInstruments musicalInstrumentsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    [cell takeInstrument:[self.allMusicalInstruments musicalInstrumentAtIndex:indexPath.row]];
    return cell;
}

- (void) initPrepearing{
    self.allMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];
    [self.tableView registerClass:[APTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}


@end
