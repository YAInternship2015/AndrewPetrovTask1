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
//#warning методами MagicalRecord это можно было сделать по-другому, более потокобезопасно. С Вашим кодом могут быть проблемы, если вы работаете с ьmain queue контекстом не на главном потоке
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            for (int i = 0; i < namesArray.count; i++) {
                APInstrumentsType *type = [APInstrumentsType MR_createEntityInContext:localContext];
                type.typeName = namesArray[i];
            }
        }];
    }
}

+ (void)deleteInstrument:(APMusicalInstrument *)instrument {
//#warning Здесь также с MagicalRecord потокобезопасно делать
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        [instrument MR_deleteEntityInContext:localContext];
    }];
}
@end
