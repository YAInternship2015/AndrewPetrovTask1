//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAllMusicalInstruments.h"

@interface APAllMusicalInstruments ()

@property (strong, nonatomic) NSArray* musicalInstruments;

@end


@implementation APAllMusicalInstruments

- (void) addMusicalInstrumentWithName:(NSString*) name description:(NSString*) description andImage:(UIImage*) image{
    
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
    
    APAllMusicalInstruments* AllMusicalInstruments = [[APAllMusicalInstruments alloc] init];
    
    AllMusicalInstruments.musicalInstruments = [[NSArray alloc] init];
//
//    [AllMusicalInstruments addMusicalInstrumentWithName:@"drumkit"
//                                            description:NSLocalizedString(@"drumkit description", nil)
//                                               andImage:[UIImage imageNamed:@"drumkit.JPG"]];
//    
//    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"electro guitar", nil)
//                                            description:NSLocalizedString(@"electro guitar description", nil)
//                                               andImage:[UIImage imageNamed:@"electro_guitar.JPG"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:@"drumkit"
                                            description:@"drumkit description"
                                               andImage:[UIImage imageNamed:@"drumkit.JPG"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:@"electro guitar"
                                            description:@"electro guitar description"
                                               andImage:[UIImage imageNamed:@"electro_guitar.JPG"]];
    return AllMusicalInstruments;
}

- (APMusicalInstrument*) musicalInstrumentAtIndex: (NSInteger) index{
    
    return (APMusicalInstrument*)self.musicalInstruments[index];
}

- (NSInteger) musicalInstrumentsCount{
    
    return self.musicalInstruments.count;
}


@end
