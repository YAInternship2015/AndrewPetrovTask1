//
//  APAllMusicalInstruments.m
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentsManager.h"

@interface APMusicalInstrumentsManager ()

@property (strong, nonatomic) NSArray* musicalInstruments;

@end


@implementation APMusicalInstrumentsManager

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

+ (APMusicalInstrumentsManager*) createBasicSetOfInsruments{
    
    APMusicalInstrumentsManager* AllMusicalInstruments = [[APMusicalInstrumentsManager alloc] init];
    
    AllMusicalInstruments.musicalInstruments = [[NSArray alloc] init];

    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"drumkit_name", nil)
                                            description:NSLocalizedString(@"drumkit_description", nil)
                                               andImage:[UIImage imageNamed:@"drumkit"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"electro_guitar_name", nil)
                                            description:NSLocalizedString(@"electro_guitar_description", nil)
                                               andImage:[UIImage imageNamed:@"electro_guitar"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"guitar_name", nil)
                                            description:NSLocalizedString(@"guitar_description", nil)
                                               andImage:[UIImage imageNamed:@"guitar"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"harp_name", nil)
                                            description:NSLocalizedString(@"harp_description", nil)
                                               andImage:[UIImage imageNamed:@"harp"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"piano_name", nil)
                                            description:NSLocalizedString(@"piano_description", nil)
                                               andImage:[UIImage imageNamed:@"piano"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"tambourine_name", nil)
                                            description:NSLocalizedString(@"tambourine_description", nil)
                                               andImage:[UIImage imageNamed:@"tambourine"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"trombone_name", nil)
                                            description:NSLocalizedString(@"trombone_description", nil)
                                               andImage:[UIImage imageNamed:@"trombone"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"trumpet_name", nil)
                                            description:NSLocalizedString(@"trumpet_description", nil)
                                               andImage:[UIImage imageNamed:@"trumpet"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"violin_name", nil)
                                            description:NSLocalizedString(@"violin_description", nil)
                                               andImage:[UIImage imageNamed:@"violin"]];
    
    [AllMusicalInstruments addMusicalInstrumentWithName:NSLocalizedString(@"xylophone_name", nil)
                                            description:NSLocalizedString(@"xylophone_description", nil)
                                               andImage:[UIImage imageNamed:@"xylophone"]];
    return AllMusicalInstruments;
}

- (APMusicalInstrument*) musicalInstrumentAtIndex: (NSInteger) index{
    // todo: add checking
    
    if (index < 0 || index >= self.musicalInstruments.count){
        return nil;
    }
    return (APMusicalInstrument*)self.musicalInstruments[index];
}

- (NSInteger) musicalInstrumentsCount{
    
    return self.musicalInstruments.count;
}


@end
