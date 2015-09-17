//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APMusicalInstrument;
@class APInstrumentsType;

//#warning объявления всех нотификейшнов также выносятся в отдельный файл, вроде APNotifications

@interface APMusicalInstrumentsManager : NSObject

+ (void)restoreInstrumentPlist;
+ (void)addInstrumentTypesIfNeeded;
+ (void)createInstrumentWithName:(NSString *)name
                     description:(NSString *)description
                            type:(APInstrumentsType *)type
                       imageName:(NSString *)image;
+ (void)deleteInstrument:(APMusicalInstrument *)instrument;

@end
