//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

const NSString *APMusicalInstrumentNameKey = @"name";
const NSString *APMusicalInstrumentDescriptionKey = @"description";
const NSString *APMusicalInstrumentImageKey = @"image";

@interface APMusicalInstrumentsManager ()

//#warning форматирование
@property (nonatomic, strong) NSMutableArray *musicalInstruments;

@end

@implementation APMusicalInstrumentsManager

+ (APMusicalInstrumentsManager *)managerWithBasicSetOfInstruments {
    
//#warning Статические методы в *.m файле должны идти первыми
//#warning Есть замечание к имени данного метода. В имени ничего не сказано о создании объекта APMusicalInstrumentsManager. Это фабричный иниализатор, так что его имя должно начинаться с имени сущности. Я бы его назвал managerWithBasicSetOfInstruments

//#warning Можно было все эти данные зашить в какой-ниюудь plist и загрузить их из файла
//#warning И вообще, так как ты находишься внутри класса, не обязательно добавлять новые айтемы через такой интерфейс. Ты знаешь, что есть внутренний массив musicalInstruments, так что можно было создавать айтемы, складировать их в некий временный NSMutableArray и затем напрямую их засеттить в musicalInstruments

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for (NSString *musicalInstrumentKey in [dictionary allKeys]) {
        
        NSDictionary *instrumentDictionary = dictionary[musicalInstrumentKey];
        APMusicalInstrument *newInstrument =
        [APMusicalInstrument instrumentWithName:NSLocalizedString(instrumentDictionary[APMusicalInstrumentNameKey], nil)
                                    description:NSLocalizedString(instrumentDictionary[APMusicalInstrumentDescriptionKey],
                                                                  nil)
                                       andImage:[UIImage imageNamed:instrumentDictionary[APMusicalInstrumentImageKey]]];
        if (!newInstrument) continue;
        
        [tempArray addObject:newInstrument];
    }
    
    APMusicalInstrumentsManager *allMusicalInstruments = [[APMusicalInstrumentsManager alloc] init];
    allMusicalInstruments.musicalInstruments = tempArray;
    return allMusicalInstruments;
}

- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index {
    
    if (index < 0 || index >= self.musicalInstruments.count) {
        return nil;
    }
    return (APMusicalInstrument *)self.musicalInstruments[index];
}

- (NSInteger)musicalInstrumentsCount {
    
    return self.musicalInstruments.count;
}


@end
