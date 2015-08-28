//
//  APValidator.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtValidator.h"

NSString *const APMusicalInstrunemtDomain = @"APMusicalInstrunemtDomain";

@implementation APMusicalInstrunemtValidator

+ (BOOL)validateName:(NSString *)name error:(NSError **)error {
    if (name.length < 5) {
        if (error) {
            NSDictionary *userInfo = @{@"NSLocalizedDescription" : NSLocalizedString(@"the_name_should_be_longer", nil)};
            *error = [NSError errorWithDomain:APMusicalInstrunemtDomain
                                         code:42
                                     userInfo:userInfo];
        }
        return NO;
    }
    return YES;
}

+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error {
    if (type < 0 || type > 3) {
        if (error) {
            NSDictionary *userInfo = @{@"NSLocalizedDescription" : NSLocalizedString(@"invalid_type", nil)};
            *error = [NSError errorWithDomain:APMusicalInstrunemtDomain
                                         code:43
                                     userInfo:userInfo];
        }
        return NO;
    }
    return YES;
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

+ (BOOL)isInstrumentNameWeak:(NSString *)name {
    if (name.length < 3) {
        return YES;
    }
    else return NO;
}

@end