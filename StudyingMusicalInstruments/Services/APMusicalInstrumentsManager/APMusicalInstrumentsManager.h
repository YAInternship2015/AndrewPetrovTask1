//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APMusicalInstrument;

//#warning объявления всех нотификейшнов также выносятся в отдельный файл, вроде APNotifications

@interface APMusicalInstrumentsManager : NSObject

+ (void)saveInstrument:(APMusicalInstrument *)instrument;
+ (void)restoreInstrumentPlist;
+ (void)addInstrumentTypesToCoreData;
+ (void)addInstrumentsToCoreData;

@end
