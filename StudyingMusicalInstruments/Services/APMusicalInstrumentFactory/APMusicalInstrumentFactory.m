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

@implementation APMusicalInstrumentFactory

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                  imageName:(NSString *)image {
    APMusicalInstrument *newMusicalInstrument  = [APMusicalInstrument instrumentWithName:name
                                                                             description:description
                                                                                    type:type
                                                                               imageName:image];
    return newMusicalInstrument;
}

@end
