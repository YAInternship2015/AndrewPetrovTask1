//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

@interface APAllMusicalInstruments : NSObject

@property (strong, nonatomic) NSArray* musicalInstruments;

- (void) addMusicalInstrumentWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;
- (void) removeMusicalInstrumentWithName:(NSString*) name;
+ (APAllMusicalInstruments*) createBasicSetOfInsruments;


@end
