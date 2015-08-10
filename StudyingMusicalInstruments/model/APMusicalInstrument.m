//
//  APMusicalInstrument.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrument.h"

@interface APMusicalInstrument ()

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* instrumentDescription;
@property (assign, nonatomic) enum MusicalInsrymentType type;
@property (strong, nonatomic) UIImage* instrumentImage;

@end

@implementation APMusicalInstrument

+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description type:(enum MusicalInsrymentType) type andImage:(UIImage*) image{
    
    APMusicalInstrument* newMusicalInstrument  = [[APMusicalInstrument alloc] init];
    newMusicalInstrument.name                  = name;
    newMusicalInstrument.instrumentDescription = description;
    newMusicalInstrument.instrumentImage       = image;
    newMusicalInstrument.type                  = type;
    return newMusicalInstrument;
}

@end
