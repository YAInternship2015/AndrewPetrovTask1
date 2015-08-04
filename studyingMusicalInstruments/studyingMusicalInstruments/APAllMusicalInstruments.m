//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAllMusicalInstruments.h"

@implementation APAllMusicalInstruments

- (void) addMusicalInstrumentWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image{
    
    APMusicalInstrument* newMusicalInstrument = [APMusicalInstrument initWithName:name description:description andImage:image];
    
    if (!self.musicalInstruments) {
        self.musicalInstruments = [[NSArray alloc] init];
    }
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:self.musicalInstruments];
    [tempArray addObject:newMusicalInstrument];
    self.musicalInstruments = [tempArray copy];
}


- (void) removeMusicalInstrumentWithName:(NSString*) name{
    
    NSMutableArray* tempArray = [[NSMutableArray alloc] initWithArray:self.musicalInstruments];

    for (APMusicalInstrument* instument in self.musicalInstruments) {
        if ([instument.name isEqual:name]) {
            [tempArray removeObject:instument];
        }
    }
     self.musicalInstruments = [tempArray copy];
}

+ (APAllMusicalInstruments*) createBasicSetOfInsruments{
    
    self.musicalInstruments = [[NSArray alloc] init];

    [self addMusicalInstrumentWithName:NSLocalizedString(@"drumkit", nil)
                           description:NSLocalizedString(@"drumkitDescription", nil)
                              andImage:[UIImage imageNamed:@"drumkit.JPG"]];
    
    
    
}

@end
