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

@interface APMusicalInstrument : NSObject

@property (strong, nonatomic, readonly) NSString* name;
@property (strong, nonatomic, readonly) NSString* instrumentDescription;
@property (assign, nonatomic, readonly) enum MusicalInsrymentType type;
@property (strong, nonatomic, readonly) UIImage* instrumentImage;


+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description type:(enum MusicalInsrymentType) type andImage: (UIImage*) image;

@end
