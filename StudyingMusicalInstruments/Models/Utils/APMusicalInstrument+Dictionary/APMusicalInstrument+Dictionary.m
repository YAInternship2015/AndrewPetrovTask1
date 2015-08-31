//
//  APMusicalInstrumentsManager+appearance.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/31/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrument+Dictionary.h"

@implementation APMusicalInstrument (Dictionary)

+ (NSDictionary *)dictionaryWithInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = @{
                                           @"name": instrument.name,
                                           @"description": instrument.instrumentDescription,
                                           @"type": @(instrument.type),
                                           @"image": instrument.imageName ? instrument.imageName : @""
                                           };
    return instrumentDictionary;
}

@end
