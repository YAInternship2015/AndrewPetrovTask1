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
        self.allMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];
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
        self.allMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"allMusicalInstruments initWithStyle");
        self.allMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.allMusicalInstruments.musicalInstruments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellIdentifier = @"cell";
    [self.tableView registerClass:[APTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    APTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    [cell takeInstrument:self.allMusicalInstruments.musicalInstruments[indexPath.row]];
    return cell;
}


@end
