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

@interface APTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView* tableView;
@property (strong, nonatomic) APAllMusicalInstruments* AllMusicalInstruments;

@end

@implementation APTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.AllMusicalInstruments = [APAllMusicalInstruments createBasicSetOfInsruments];
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

    return self.AllMusicalInstruments.musicalInstruments.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString* cellIdentifier = @"cell";
    [self.tableView registerClass:[APTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    APTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    
}


@end
