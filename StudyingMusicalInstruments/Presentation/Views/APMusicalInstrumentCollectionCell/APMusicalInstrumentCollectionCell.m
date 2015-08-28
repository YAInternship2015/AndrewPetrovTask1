//
//  APMusicalInstrumentCollectionCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrument.h"
#import "UIImage+StudyingMusicalInstruments.h"

NSString * const APCollectionViewCellIdentifier = @"APCollectionViewCellIdentifier";

@interface APMusicalInstrumentCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation APMusicalInstrumentCollectionCell

- (void)setInstrument:(APMusicalInstrument *)instrument {
    if (!instrument || [instrument.imageName isEqualToString:@""]) {
        self.imageView.image = [UIImage stubInstrumentCellImage];
    }
    else {
        self.imageView.image = [UIImage imageNamed:instrument.imageName];
    }
}

@end
