//
//  APMusicalInstrument.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrument.h"

@implementation APMusicalInstrument

+ (APMusicalInstrument*) initWithName: (NSString*) name andPicture: (UIImage*) picture{
    
    APMusicalInstrument* newMusicalInstrument = [[APMusicalInstrument alloc] init];
    newMusicalInstrument.name = name;
    newMusicalInstrument.picture = picture;
    return newMusicalInstrument;
}



@end
