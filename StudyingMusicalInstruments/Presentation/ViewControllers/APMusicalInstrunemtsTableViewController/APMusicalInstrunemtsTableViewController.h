//
//  APTableViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrunemtsTableViewController.h"
@protocol APMusicalInstrunemtsTableViewControllerDelegate;

@interface APMusicalInstrunemtsTableViewController : UITableViewController
<APMusicInstrumentsDataSourceDelegate>

- (instancetype)initWithDelegate:(id<APMusicalInstrunemtsTableViewControllerDelegate>)delegate;
- (void)dataSourceIsUpdated;

@end

@protocol APMusicalInstrunemtsTableViewControllerDelegate <NSObject>

- (void)addNewInstrument:(UIBarButtonItem *)sender;

@end