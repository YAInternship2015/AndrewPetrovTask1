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

@interface APTableViewController ()

@property (strong, nonatomic) APAllMusicalInstruments* allMusicalInstruments;

@end

@implementation APTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        NSLog(@"APAllMusicalInstruments created");
        self.allMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];

    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
