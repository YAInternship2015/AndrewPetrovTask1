//
//  APValidator.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

NSString * const APMusicalInstrunemtDomain;

const NSInteger APMusicalInstrumentNameValidationLengthError = 42;
const NSInteger APMusicalInstrumentTypeValidationLengthError = 43;

@interface APMusicalInstrunemtValidator : NSObject

+ (BOOL)validateName:(NSString *)name error:(NSError **)error;
+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error;
+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error;
+ (BOOL)isInstrumentNameEnough:(NSString *)name;

@end
