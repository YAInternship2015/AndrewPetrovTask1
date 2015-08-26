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

extern NSString *const APMusicalInstrunemtsTableViewControllerIdentifier;

@interface APMusicalInstrunemtsTableViewController : UITableViewController
<APMusicInstrumentsDataSourceDelegate>

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

@end