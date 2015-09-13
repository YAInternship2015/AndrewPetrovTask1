//
//  APMusicalInstrunemtFactory.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APInstrumentsType;
@class APMusicalInstrument;

//#warning опечатка в имени
@interface APMusicalInstrumentFactory : NSObject

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                      imageName:(NSString *)image;

@end
