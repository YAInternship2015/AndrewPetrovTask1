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

@interface APMusicalInstrumentCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation APMusicalInstrumentCollectionCell

- (void)setInstrument:(APMusicalInstrument *)instrument {
#warning здесь в if лучше заполнять UIImage, и затем один раз его сеттить в UIImageView
    if (!instrument || !instrument.imageName.length) {
        self.imageView.image = [UIImage stubInstrumentCellImage];
    }
    else {
        self.imageView.image = [UIImage imageNamed:instrument.imageName];
    }
}

@end
