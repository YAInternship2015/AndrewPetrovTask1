//
//  APMusicInstrumentsTableViewDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/17/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsDataSource.h"

@interface APMusicInstrumentsTableViewDataSource : APMusicInstrumentsDataSource

#warning нужно спрятать в *.m
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

