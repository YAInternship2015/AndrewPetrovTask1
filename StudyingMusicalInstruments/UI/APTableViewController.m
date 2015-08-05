//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APTableViewController.h"
#import "APTableViewCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

@interface APTableViewController ()

@property (strong, nonatomic) APMusicalInstrumentsManager* allMusicalInstruments;

@end

@implementation APTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"allMusicalInstruments initWithCoder");
        self.allMusicalInstruments = [APMusicalInstrumentsManager createBasicSetOfInsruments];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    if (self) {
        NSLog(@"allMusicalInstruments initWithNibName");
        self.allMusicalInstruments = [APMusicalInstrumentsManager createBasicSetOfInsruments];
    }
    return self;
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"allMusicalInstruments initWithStyle");
        self.allMusicalInstruments = [APMusicalInstrumentsManager createBasicSetOfInsruments];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.allMusicalInstruments musicalInstrumentsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    APTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier];
    [cell setModel:[self.allMusicalInstruments musicalInstrumentAtIndex:indexPath.row]];
    return cell;
}


@end
