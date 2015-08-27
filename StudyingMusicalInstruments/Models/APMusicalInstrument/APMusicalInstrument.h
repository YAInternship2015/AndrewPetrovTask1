//
//  APMusicalInstrument.h
//  studyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, APInstrumentsType) {
    APInstrumentsTypeWind,
    APInstrumentsTypeStringed,
    APInstrumentsTypePercussion,
    APInstrumentsTypeKeyboard
};

@interface APMusicalInstrument : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *instrumentDescription;
@property (nonatomic, assign, readonly) APInstrumentsType type;
@property (nonatomic, strong, readonly) UIImage *instrumentImage;

+ (APMusicalInstrument *)instrumentWithName:(NSString *)name
                                description:(NSString *)description
                                       type:(APInstrumentsType)type
                                      image:(UIImage *)image;

@end
