//
//  APMusicalInstrument.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning enum'ы лучше выносить в отдельные *.h файлы, называть их APInstrumentsTypesEnum. Это для того, чтобы в тех местах, где необходимо будет анализировать значения переменной этого энама, импортировать весь класс, а только сам энам
typedef NS_ENUM(NSInteger, APInstrumentsType) {
    APInstrumentsTypeWind,
    APInstrumentsTypeStringed,
    APInstrumentsTypePercussion,
    APInstrumentsTypeKeyboard
};

@interface APMusicalInstrument : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *instrumentDescription;
@property (nonatomic, assign, readonly) APInstrumentsType type;
@property (nonatomic, strong, readonly) NSString *imageName;

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType)type
#warning немного съехало форматирование
                                      imageName:(NSString *)imageName;

@end
