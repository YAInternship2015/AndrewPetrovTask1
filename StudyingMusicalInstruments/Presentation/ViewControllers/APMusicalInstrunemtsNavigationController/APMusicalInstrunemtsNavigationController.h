//
//  APMusicalInstrunemtsNavigationController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentsCollectionViewController.h"

@interface APMusicalInstrunemtsNavigationController : UINavigationController <APMusicalInstrunemtsTableViewControllerDelegate, APMusicalInstrumentsCollectionViewControllerDelegate>

- (void)addNewInstrument:(UIBarButtonItem *)sender;
- (void)setCollectionView:(UIBarButtonItem *)sender;

@end
