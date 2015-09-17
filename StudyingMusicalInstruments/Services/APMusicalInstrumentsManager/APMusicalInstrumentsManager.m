//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"
#import <MagicalRecord.h>
#import "APInstrumentsType.h"
#import "APMusicalInstrumentFactory.h"
#import "APMusicalInstrument.h"

@implementation APMusicalInstrumentsManager

+ (void)createInstrumentWithName:(NSString *)name
                     description:(NSString *)description
                            type:(APInstrumentsType *)type
                       imageName:(NSString *)image {
    [APMusicalInstrumentFactory instrumentWithName:name
                                       description:description
                                              type:type
                                         imageName:name];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)addInstrumentTypesIfNeeded {
    if (![APInstrumentsType MR_countOfEntities]) {
        NSArray *namesArray = @[@"APInstrumentsTypeWind", @"APInstrumentsTypeStringed",
                                @"APInstrumentsTypePercussion", @"APInstrumentsTypeKeyboard"];
        NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
        for (int i = 0; i < namesArray.count; i++) {
            APInstrumentsType *type = [APInstrumentsType MR_createEntity];
            type.typeName = namesArray[i];
        }
        [context MR_saveToPersistentStoreAndWait];
    }
}

+ (void)deleteInstrument:(APMusicalInstrument *)instrument {
    [instrument MR_deleteEntity];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
@end
