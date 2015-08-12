//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

//#warning Здесь можно было обойтись @class APMusicalInstrument; и не импортировать класс
@class APMusicalInstrument;
@class UIImage;

//#warning Абсолютно правильная идея - создать отдельный "датасорс" для вью контроллера, а не лепить все данные прямо во вью контроллере. Зачёт

@interface APMusicalInstrumentsManager : NSObject

+ (APMusicalInstrumentsManager *)managerWithBasicSetOfInstruments;
- (APMusicalInstrument *)musicalInstrumentAtIndex:(NSInteger)index;
- (NSInteger)musicalInstrumentsCount;

@end
