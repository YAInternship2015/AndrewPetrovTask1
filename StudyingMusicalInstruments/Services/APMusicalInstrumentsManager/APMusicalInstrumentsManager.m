//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrumentsManager.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrumentNotifications.h"
#import "APMusicalInstrument+Dictionary.h"
#import "APMusicInstrumentsKeyConstants.h"
#import <MagicalRecord.h>
#import "APInstrumentsType.h"
#import "APMusicInstrumentsTypesDataSource.h"
#import "APMusicalInstrumentFactory.h"

//#warning категории выносите в отдельные файлы
//#warning и здесь по смыслу все же написать категорию на APMusicalInstrument и в нее добавить метод вроде - (NSDictionary *)dictionaryRepresentation. Для класса NSDictionary слишком "жирно" знать, как разбирать модели
@implementation APMusicalInstrumentsManager

+ (NSDictionary *)instrumentsPlistContent {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dictionary;
}

+ (void)restoreInstrumentPlist {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSFileManager instrumentsPlistPath];
    BOOL fileExists = [fileManager fileExistsAtPath: docPath];
    NSError *error = nil;
    if(fileExists) {
        [fileManager removeItemAtPath:docPath error:&error];
    }
    NSString *strSourcePath = [NSFileManager sourceInstrumentsPlistPath];
    [fileManager copyItemAtPath:strSourcePath toPath:docPath error:&error];
}

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

@end
