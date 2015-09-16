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

@interface APMusicInstrumentsDataSource : NSObject <APAddMusicalInstrumentViewControllerDelegate>

- (NSInteger)musicalInstrumentsCountByTypeWithIndex:(NSInteger)index;
- (APMusicalInstrument *)musicalInstrumentWithTypeIndex:(NSInteger)typeIndex
                                                atIndex:(NSInteger)index;
- (NSString *)musicalInstrumentTypeNameStringAtIndex:(NSInteger)index;
- (NSArray *)musicalInstrumentTypes;
- (NSArray *)musicalInstruments;

@end

@protocol APMusicInstrumentsDataSourceDelegate <NSObject>

@optional//???: why?

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

@end
