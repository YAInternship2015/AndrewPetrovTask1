//
//  APMusicalInstrumentsManager+appearance.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/31/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrument.h"
@class NSDictionary;

@interface APMusicalInstrument (Dictionary)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument;

@end
