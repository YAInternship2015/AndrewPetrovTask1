//
//  APAllMusicalInstruments.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APMusicalInstrument.h"

@interface APMusicalInstrumentsManager : NSObject


+ (APMusicalInstrumentsManager*) createBasicSetOfInsruments;
- (APMusicalInstrument*) musicalInstrumentAtIndex: (NSInteger) index;
- (NSInteger) musicalInstrumentsCount;
- (void) addMusicalInstrumentWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;
- (void) removeMusicalInstrumentWithName:(NSString*) name;


@end
