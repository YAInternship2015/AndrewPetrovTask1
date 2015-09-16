//
//  APMusicalInstrunemtFactory.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentFactory.h"
#import "APMusicalInstrument.h"
#import "APInstrumentsType.h"
#import <MagicalRecord.h>

@implementation APMusicalInstrumentFactory

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                  imageName:(NSString *)image {
    APMusicalInstrument *instrument = [APMusicalInstrument MR_createEntity];
    instrument.name = name;
    instrument.type = type;
    instrument.instrumentDescription = description;
    instrument.imageName = image;
    return instrument;
}

@end
