//
//  APValidator.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

extern NSString *const APMusicalInstrunemtDomain;

@interface APMusicalInstrunemtValidator : NSObject

+ (BOOL)validateName:(NSString *)name error:(NSError **)error;
+ (BOOL)validateType:(APInstrumentsType)type error:(NSError **)error;
+ (BOOL)validateInstrument:(APMusicalInstrument *)instrument error:(NSError **)error;

@end
