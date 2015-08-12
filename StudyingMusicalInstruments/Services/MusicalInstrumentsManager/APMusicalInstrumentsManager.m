//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

@interface APMusicalInstrumentsManager ()

//#warning форматирование
@property (nonatomic, strong) NSMutableArray *musicalInstruments;

@end

@implementation APMusicalInstrumentsManager

+ (APMusicalInstrumentsManager *)managerWithBasicSetOfInstruments {
    
    APMusicalInstrumentsManager *allMusicalInstruments = [[APMusicalInstrumentsManager alloc] init];
    
    allMusicalInstruments.musicalInstruments = [[NSMutableArray alloc] init];
    
//#warning Статические методы в *.m файле должны идти первыми
//#warning Есть замечание к имени данного метода. В имени ничего не сказано о создании объекта APMusicalInstrumentsManager. Это фабричный иниализатор, так что его имя должно начинаться с имени сущности. Я бы его назвал managerWithBasicSetOfInstruments

    
#warning Можно было все эти данные зашить в какой-ниюудь plist и загрузить их из файла
#warning И вообще, так как ты находишься внутри класса, не обязательно добавлять новые айтемы через такой интерфейс. Ты знаешь, что есть внутренний массив musicalInstruments, так что можно было создавать айтемы, складировать их в некий временный NSMutableArray и затем напрямую их засеттить в musicalInstruments
    /*[allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"drumkit_name", nil)
                                            description:NSLocalizedString(@"drumkit_description", nil)
                                               andImage:[UIImage imageNamed:@"drumkit"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"electro_guitar_name", nil)
                                            description:NSLocalizedString(@"electro_guitar_description", nil)
                                               andImage:[UIImage imageNamed:@"electro_guitar"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"guitar_name", nil)
                                            description:NSLocalizedString(@"guitar_description", nil)
                                               andImage:[UIImage imageNamed:@"guitar"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"harp_name", nil)
                                            description:NSLocalizedString(@"harp_description", nil)
                                               andImage:[UIImage imageNamed:@"harp"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"piano_name", nil)
                                            description:NSLocalizedString(@"piano_description", nil)
                                               andImage:[UIImage imageNamed:@"piano"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"tambourine_name", nil)
                                            description:NSLocalizedString(@"tambourine_description", nil)
                                               andImage:[UIImage imageNamed:@"tambourine"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"trombone_name", nil)
                                            description:NSLocalizedString(@"trombone_description", nil)
                                               andImage:[UIImage imageNamed:@"trombone"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"trumpet_name", nil)
                                            description:NSLocalizedString(@"trumpet_description", nil)
                                               andImage:[UIImage imageNamed:@"trumpet"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"violin_name", nil)
                                            description:NSLocalizedString(@"violin_description", nil)
                                               andImage:[UIImage imageNamed:@"violin"]];
    
    [allMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"xylophone_name", nil)
                                            description:NSLocalizedString(@"xylophone_description", nil)
                                               andImage:[UIImage imageNamed:@"xylophone"]];*/
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSArray *namesArray = [dictionary allKeys];
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for (NSString *musicalInstrument in namesArray) {
        NSDictionary *instrumentDictionary = [dictionary objectForKey:musicalInstrument];
        APMusicalInstrument *newInstrument =
        [APMusicalInstrument instrumentWithName:[instrumentDictionary objectForKey:@"name"]
                                    description:[instrumentDictionary objectForKey:@"description"]
                                       andImage:[UIImage imageNamed:[instrumentDictionary objectForKey:@"image"]]];
        [tempArray addObject:newInstrument];
    }
    NSLog(@"%@", tempArray);
    
    allMusicalInstruments.musicalInstruments = tempArray;
    
    return allMusicalInstruments;
}

- (void)addMusicalInstrumentWithName:(NSString *)name description:(NSString *)description andImage:(UIImage *)image {
//     убрать а выше через врем массив

    APMusicalInstrument *newMusicalInstrument = [APMusicalInstrument instrumentWithName:name
                                                                            description:description
                                                                               andImage:image];

    if (!self.musicalInstruments) {
        self.musicalInstruments = [[NSMutableArray alloc] init];
    }
    [self.musicalInstruments addObject:newMusicalInstrument];
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
