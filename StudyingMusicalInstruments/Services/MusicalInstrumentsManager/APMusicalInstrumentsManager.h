//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

@class UIImage;

@interface APMusicalInstrumentsManager : NSObject

+ (APMusicalInstrumentsManager *)managerWithBasicSetOfInstruments;
+ (void)saveInstrument:(APMusicalInstrument *)instrument;
+ (void)copyInstrumentPlistToMainBundle;

@end
