//
//  APValidator.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtValidator.h"

NSString * const APMusicalInstrunemtDomain = @"APMusicalInstrunemtDomain";
const NSInteger APMusicalInstrumentNameMinLength = 3;
const NSInteger APMusicalInstrumentStrongNameMinLength = 5;
const NSInteger APMusicalInstrumentNameValidationLengthError = 42;
const NSInteger APMusicalInstrumentTypeValidationLengthError = 43;

@implementation APMusicalInstrunemtValidator

+ (BOOL)validateName:(NSString *)name error:(NSError **)error {
    if (name.length < APMusicalInstrumentNameMinLength) {
        if (error) {
            NSDictionary *userInfo = @{@"NSLocalizedDescription" : NSLocalizedString(@"the_name_should_be_longer", nil)};
            *error = [NSError errorWithDomain:APMusicalInstrunemtDomain
                                         code:APMusicalInstrumentNameValidationLengthError
                                     userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}

+ (BOOL)isInstrumentNameStrongEnough:(NSString *)name {
    if (name.length >= APMusicalInstrumentStrongNameMinLength) {
        return YES;
    }
    return NO;
}

+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error {
    BOOL isValid = NO;
    switch (type) {
        case APInstrumentsTypeWind:
        case APInstrumentsTypeStringed:
        case APInstrumentsTypePercussion:
        case APInstrumentsTypeKeyboard:
            isValid = YES;
            break;
    }
    if (isValid && error) {
        NSDictionary *userInfo = @{@"NSLocalizedDescription" : NSLocalizedString(@"invalid_type", nil)};
        *error = [NSError errorWithDomain:APMusicalInstrunemtDomain
                                     code:APMusicalInstrumentTypeValidationLengthError
                                 userInfo:userInfo];
    }
    return isValid;
}

+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error {
    if (![APMusicalInstrunemtValidator validateName:instrument.name error:error]) {
        return NO;
    }
    else if (![APMusicalInstrunemtValidator validateType:instrument.type error:error]) {
        return NO;
    }
    return YES;
}

@end