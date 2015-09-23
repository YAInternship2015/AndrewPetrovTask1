//
//  APValidator.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentValidator.h"
#import "APMusicInstrumentsErrorConstants.h"
#import "APInstrumentsType.h"

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

+ (BOOL)validateType:(APInstrumentsType *)type error:(NSError **)error {
    BOOL isValid = NO;
    if ([type.typeName isEqualToString:@"APInstrumentsTypeWind"] ||
        [type.typeName isEqualToString:@"APInstrumentsTypeStringed"] ||
        [type.typeName isEqualToString:@"APInstrumentsTypePercussion"] ||
        [type.typeName isEqualToString:@"APInstrumentsTypeKeyboard"]) {
        isValid = YES;
    }
    if (!isValid && error) {
        NSDictionary *userInfo = @{@"NSLocalizedDescription" : NSLocalizedString(@"invalid_type", nil)};
        *error = [NSError errorWithDomain:APMusicalInstrunemtDomain
                                     code:APMusicalInstrumentTypeValidationLengthError
                                 userInfo:userInfo];
    }
    return isValid;
}

+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error {
#warning три return в одном методе - слишеом много. Последнее время вообще наталкиваюсь на то, что в методе должен быть один return. То есть в начале метода объявляется переменная BOOL isValid = YES, и внутри if она заполняется значением.
    if (![APMusicalInstrumentValidator validateName:instrument.name error:error]) {
        return NO;
    }
    else if (![APMusicalInstrumentValidator validateType:instrument.type error:error]) {
        return NO;
    }
    return YES;
}

@end