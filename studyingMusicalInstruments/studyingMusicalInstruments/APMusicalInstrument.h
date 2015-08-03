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
@property (strong, nonatomic) UIImage* picture;

+ (APMusicalInstrument*) initWithName: (NSString*) name andPicture: (UIImage*) picture;

@end
