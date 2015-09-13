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
        [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotificaion object:nil];
    }];
    
}


/*+ (void)saveInstrument:(APMusicalInstrument *)instrument {
    NSDictionary *instrumentDictionary = [APMusicalInstrument dictionaryWithInstrument:instrument];
    NSMutableDictionary *tempDictionary = [NSMutableDictionary new];
    NSDictionary *oldDictionary = [self instrumentsPlistContent];
    
    for (NSString *key in [oldDictionary allKeys]) {
        [tempDictionary setObject:[oldDictionary[key]mutableCopy] forKey:key];
    }
    [tempDictionary[APInstrumentsPlistKey] setObject:instrumentDictionary forKey:instrument.name];
    
    
    if(![NSFileManager isInstrumentsPlistExist]) {
        [self restoreInstrumentPlist];
    }

    if ([tempDictionary writeToFile:[NSFileManager instrumentsPlistPath] atomically:YES]) {
        NSLog(@"file updated");
        [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotificaion object:nil];
    }
    else
        NSLog(@"file not updated");
}*/

@end
