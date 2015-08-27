//
//  APMusicalInstrunemtFactory.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtFactory.h"

@implementation APMusicalInstrunemtFactory

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType)type
                                      image:(UIImage *)image {
    APMusicalInstrument *newMusicalInstrument  = [APMusicalInstrument instrumentWithName:name
                                                                             description:description
                                                                                    type:type
                                                                                   image:image];
    return newMusicalInstrument;
}

@end
