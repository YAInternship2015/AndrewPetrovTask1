//
//  APTableViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicInstrumentsDataSource.h"

@interface APMusicalInstrunemtsViewController : UITableViewController <APMusicInstrumentsDataSourceDelegate>

- (void)dataSourceIsUpdated;

@end
