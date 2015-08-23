//
//  APValidator.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

@interface APValidator : NSObject

+ (BOOL)validateName:(NSString *)name;
+ (BOOL)validateType:(APInstrumentsType)type;

@end
