//
//  APMusicalInstrument.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>


enum MusicalInsrymentType{
    Wind,
    Stringed,
    Percussion,
    Keyboard
};

#warning За отдельную модель данных - зачёт)


@interface APMusicalInstrument : NSObject

#warning (nonatomic, strong, readonly)
@property (strong, nonatomic, readonly) NSString* name;
@property (strong, nonatomic, readonly) NSString* instrumentDescription;
@property (assign, nonatomic, readonly) enum MusicalInsrymentType type;
@property (strong, nonatomic, readonly) UIImage* instrumentImage;



+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description type:(enum MusicalInsrymentType) type andImage: (UIImage*) image;

#warning снова форматирование поехало
#warning init методы всегда делаются методами объекта (-). Если хочешь статически создавать объект (+), то тебе нужен так называемый фабричный инициализатор, но он должен называться instrumentWithName:..., по аналогии с [NSArray arrayWith...]
+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;


@end
