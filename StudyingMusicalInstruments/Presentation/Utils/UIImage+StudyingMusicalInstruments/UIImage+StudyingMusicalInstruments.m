//
//  UIImage+StudyingMusicalInstruments.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/5/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "UIImage+StudyingMusicalInstruments.h"

@implementation UIImage (StudyingMusicalInstruments)

+ (UIImage *)stubInstrumentCellImage {
    return [UIImage imageNamed:@"sellStubImage"];
}

+ (UIImage *)tableImage {
    return [UIImage imageNamed:@"list-simple-7"];
}

+ (UIImage *)collectionImage {
    return [UIImage imageNamed:@"square-individual-nine-7"];
}

@end
