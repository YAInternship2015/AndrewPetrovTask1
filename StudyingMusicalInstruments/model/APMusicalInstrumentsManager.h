//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning Здесь можно было обойтись @class APMusicalInstrument; и не импортировать класс
#import "APMusicalInstrument.h"

#warning Абсолютно правильная идея - создать отдельный "датасорс" для вью контроллера, а не лепить все данные прямо во вью контроллере. Зачёт

@interface APMusicalInstrumentsManager : NSObject


+ (APMusicalInstrumentsManager*) createBasicSetOfInsruments;
- (APMusicalInstrument*) musicalInstrumentAtIndex: (NSInteger) index;
- (NSInteger) musicalInstrumentsCount;
- (void) addMusicalInstrumentWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;
- (void) removeMusicalInstrumentWithName:(NSString*) name;


@end
