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

+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        APMusicalInstrument *instrumentEntity = [APMusicalInstrument MR_createEntity];
        instrumentEntity = instrument;
        
    } completion:^(BOOL success, NSError *error) {
//        [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotificaion object:nil];
    }];
    
}

+ (void)addInstrumentTypesToCoreData {
    APMusicInstrumentsTypesDataSource *musicInstrumentsTypesDataSource = [[APMusicInstrumentsTypesDataSource alloc] init];
    if (![musicInstrumentsTypesDataSource musicalInstrumentTypes].count) {
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

+ (void)addInstrumentsToCoreData {
    APMusicInstrumentsTypesDataSource *musicInstrumentsTypesDataSource =
    [[APMusicInstrumentsTypesDataSource alloc] init];
    NSArray *typesArray = [musicInstrumentsTypesDataSource musicalInstrumentTypes];
    NSArray *namesArray = @[@"aaa", @"bbb", @"aaa1", @"bbb2", @"ccc", @"ddd", @"ccc1", @"ddd2"];
    int k = 0;
    for (int i = 0; i < typesArray.count; i++) {
        for (int j = 0; j < 2; j++) {
            APMusicalInstrument *instrument = [APMusicalInstrument MR_createEntity];
            instrument.name = namesArray[k++];
            instrument.type = typesArray[i];
            instrument.instrumentDescription = @"qqqqqq";
        }
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
