//
//  APMusicInstrumentsDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

@protocol APMusicInstrumentsDataSourceDelegate;

@interface APMusicInstrumentsDataSource : NSObject

- (instancetype)initWithDelegate:(id<APMusicInstrumentsDataSourceDelegate>)delegate;

- (NSInteger)musicalInstrumentsTypesCount;
- (NSInteger)musicalInstrumentsCountWithType:(APInstrumentsType)type;
- (APMusicalInstrument *)musicalInstrumentWithType:(APInstrumentsType)type atIndex:(NSInteger)index;
- (NSString *)musicalInstrumentTypeNameStringAtIndex:(NSInteger)index;
- (NSInteger)musicalInstrumentsCount;
- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index;

@end

@protocol APMusicInstrumentsDataSourceDelegate <NSObject>

@optional

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

@end
