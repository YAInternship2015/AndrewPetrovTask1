//
//  APMusicInstrumentsDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/20/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMusicInstrumentsDataSource : NSObject

- (NSInteger)musicalInstrumentsTypesCount;
- (NSInteger)musicalInstrumentsCountWithType:(APInstrumentsType)type;
- (APMusicalInstrument *)musicalInstrumentWithType:(APInstrumentsType)type atIndex:(NSInteger)index;
- (NSString *)musicalInstrumentTypeNameStringAtIndex:(NSInteger)index;
- (NSInteger)musicalInstrumentsCount;
- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index;

@end
