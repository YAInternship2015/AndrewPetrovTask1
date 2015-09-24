//
//  APMusicInstrumentsDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APAddMusicalInstrumentViewController.h"
#import <CoreData/CoreData.h>
@class APMusicalInstrument;

@protocol APMusicInstrumentsDataSourceDelegate;

@interface APMusicInstrumentsDataSource : NSObject <NSFetchedResultsControllerDelegate>

- (NSInteger)musicalInstrumentsCountByTypeWithIndex:(NSInteger)index;
- (APMusicalInstrument *)musicalInstrumentWithTypeIndex:(NSInteger)typeIndex
                                                atIndex:(NSInteger)index;
- (NSString *)musicalInstrumentTypeNameAtIndex:(NSInteger)index;
- (NSInteger)musicalInstrumentTypesCount;
- (NSArray *)musicalInstruments;
- (void)dataIsUpdated;

@end

//#warning этот протокол никто не реализовал - зачем он нужен?
// здась то же самое, это я сделал на будущее, "на вырост" программы.
@protocol APMusicInstrumentsDataSourceDelegate <NSObject>

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

@end
