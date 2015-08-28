//
//  APValidator.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentValidator.h"
#import "APMusicInstrumentsConstants.h"

//#warning чтобы не раскидывать объявления констант в *.h и *.m файлы, досточно писать в *.m
// static const NSInteger APMusicalInstrumentNameMinLength = 3;
// static NSString *const APSomeObjectConstant = @"Constant";

@implementation APMusicalInstrumentValidator

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
    if (![APMusicalInstrumentValidator validateName:instrument.name error:error]) {
        return NO;
    }
    else if (![APMusicalInstrumentValidator validateType:instrument.type error:error]) {
        return NO;
    }
    return YES;
}

@end