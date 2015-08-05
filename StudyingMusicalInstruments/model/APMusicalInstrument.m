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
@property (strong, nonatomic) UIImage* instrumentImage;

@end

@implementation APMusicalInstrument

+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image{
    
    APMusicalInstrument* newMusicalInstrument = [[APMusicalInstrument alloc] init];
    newMusicalInstrument.name = name;
    newMusicalInstrument.instrumentDescription = description;
    newMusicalInstrument.instrumentImage = image;
    return newMusicalInstrument;
}

@end
