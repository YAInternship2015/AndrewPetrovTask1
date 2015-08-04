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

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* description;
@property (strong, nonatomic) UIImage* image;

+(APMusicalInstrument*) initWithName:(NSString*) name description:(NSString*) description andImage: (UIImage*) image;

@end
