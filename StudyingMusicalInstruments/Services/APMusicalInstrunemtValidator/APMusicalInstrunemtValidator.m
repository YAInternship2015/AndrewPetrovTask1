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
            return NO;
        }
    }
    return YES;
}

+ (BOOL)validateType:(APInstrumentsType)type {
    if (type < 0 || type > 3) {
        return NO;
    }
    return YES;
}
//TODO: val instr и сквозной error
@end