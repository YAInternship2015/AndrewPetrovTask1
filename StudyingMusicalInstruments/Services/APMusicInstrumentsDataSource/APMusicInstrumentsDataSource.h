//
//  APMusicInstrumentsDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"
#import "APAddMusicalInstrumentViewController.h"

@protocol APMusicInstrumentsDataSourceDelegate;

@interface APMusicInstrumentsDataSource : NSObject

- (NSInteger)musicalInstrumentsCountByTypeWithIndex:(NSInteger)index;
- (APMusicalInstrument *)musicalInstrumentWithTypeIndex:(NSInteger)typeIndex
                                                atIndex:(NSInteger)index;
- (NSString *)musicalInstrumentTypeNameAtIndex:(NSInteger)index;
- (NSArray *)musicalInstrumentTypes;
- (NSArray *)musicalInstruments;

@end

@protocol APMusicInstrumentsDataSourceDelegate <NSObject>

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

@end
