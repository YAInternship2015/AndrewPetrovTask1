//
//  APMusicalInstrument.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APMusicalInstrument : NSObject

@property (strong, nonatomic, readonly) NSString* name;
@property (strong, nonatomic, readonly) NSString* instrumentDescription;
@property (strong, nonatomic, readonly) UIImage* instrumentImage;

+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;

@end
