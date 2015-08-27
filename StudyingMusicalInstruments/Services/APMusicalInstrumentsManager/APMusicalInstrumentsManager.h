//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APMusicalInstrument;

extern NSString* const APModelDidChangeNotificaion;

@interface APMusicalInstrumentsManager : NSObject

+ (void)saveInstrument:(APMusicalInstrument *)instrument;
+ (void)restoreInstrumentPlist;

@end
