//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtsNavigationController.h"

@implementation APMusicalInstrunemtsNavigationController

- (void)viewDidLoad {
    self.tableVC = [[APMusicalInstrunemtsTableViewController alloc] initWithDelegate:self];
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    NSLog(@"go to adding");
}

@end
