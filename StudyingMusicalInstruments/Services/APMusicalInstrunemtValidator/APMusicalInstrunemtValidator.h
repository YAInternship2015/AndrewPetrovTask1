//
//  APValidator.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

OBJC_EXTERN NSString * const APMusicalInstrunemtDomain;
OBJC_EXTERN const NSInteger APMusicalInstrumentNameValidationLengthError;
OBJC_EXTERN const NSInteger APMusicalInstrumentTypeValidationLengthError;

#warning опечатка в имени
@interface APMusicalInstrunemtValidator : NSObject

+ (BOOL)validateName:(NSString *)name error:(NSError **)error;
+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error;
+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error;
+ (BOOL)isInstrumentNameStrongEnough:(NSString *)name;

@end
