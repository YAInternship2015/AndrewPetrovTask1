//
//  APMusicalInstrunemtFactory.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/18/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentFactory.h"
#import "APMusicalInstrument.h"
#import "APInstrumentsType.h"
#import <MagicalRecord.h>

@implementation APMusicalInstrumentFactory

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType *)type
                                  imageName:(NSString *)image {
    APMusicalInstrument *instrument = [APMusicalInstrument MR_createEntity];
    instrument.name = name;
    instrument.type = type;
    instrument.instrumentDescription = description;
    instrument.imageName = [self randomImageNameForType:type];
    return instrument;
}
//TODO: add random picture by type
+ (NSString *)randomImageNameForType:(APInstrumentsType *)type {
    
    NSArray *windImageNames = @[@"trumpet", @"trombone"];
    NSArray *stringedImageNames = @[@"violin", @"harp", @"guitar", @"electro_guitar"];
    NSArray *percussionImageNames = @[@"tambourine", @"drumkit"];
    NSArray *keyboardImageNames = @[@"xylophone", @"piano"];
    
    if ([type.typeName isEqualToString:@"APInstrumentsTypeWind"]) {
        return windImageNames[arc4random_uniform(windImageNames.count)];
    }
    else if ([type.typeName isEqualToString:@"APInstrumentsTypeStringed"]) {
        return stringedImageNames[arc4random_uniform(stringedImageNames.count)];
    }
    else if ([type.typeName isEqualToString:@"APInstrumentsTypePercussion"]) {
        return percussionImageNames[arc4random_uniform(percussionImageNames.count)];
    }
    else if ([type.typeName isEqualToString:@"APInstrumentsTypeKeyboard"]) {
        return keyboardImageNames[arc4random_uniform(keyboardImageNames.count)];
    }
    else return nil;
}

@end

