//
//  APMusicalInstrument.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrument.h"

@interface APMusicalInstrument ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *instrumentDescription;
@property (nonatomic, assign) APInstrumentsType type;
@property (nonatomic, strong) NSString *imageName;

@end

@implementation APMusicalInstrument

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType)type
                                      image:(NSString *)image {
    
    APMusicalInstrument *newMusicalInstrument  = [[APMusicalInstrument alloc] init];
    newMusicalInstrument.name = name;
    newMusicalInstrument.instrumentDescription = description;
    newMusicalInstrument.type = type;
    newMusicalInstrument.imageName = image;
    return newMusicalInstrument;
}

@end
