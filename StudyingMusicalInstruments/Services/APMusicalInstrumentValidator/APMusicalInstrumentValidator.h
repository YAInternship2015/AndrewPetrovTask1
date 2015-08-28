//
//  APValidator.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

//#warning опечатка в имени
@interface APMusicalInstrumentValidator : NSObject

+ (BOOL)validateName:(NSString *)name error:(NSError **)error;
+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error;
+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error;
+ (BOOL)isInstrumentNameStrongEnough:(NSString *)name;

@end
