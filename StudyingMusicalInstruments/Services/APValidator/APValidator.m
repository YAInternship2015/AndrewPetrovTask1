//
//  APValidator.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APValidator.h"

@implementation APValidator


+ (BOOL)validateName:(NSString *)name {
    if (name.length < 3) {
        return NO;
    }
    return YES;
}

+ (BOOL)validateType:(APInstrumentsType)type {
    if (type < 0 || type > 3) {
        return NO;
    }
    return YES;
}

@end
