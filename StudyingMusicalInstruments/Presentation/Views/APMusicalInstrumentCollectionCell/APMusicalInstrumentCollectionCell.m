//
//  APMusicalInstrumentCollectionCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentCell.h"
#import "APMusicalInstrument.h"
#import "UIImage+StudyingMusicalInstruments.h"

NSString* const APCollectionViewCellIdentifier = @"APCollectionViewCellIdentifier";

@implementation APMusicalInstrumentCollectionCell

- (void)setInstrument:(APMusicalInstrument *)instrument {
    if (!instrument) {
        self.imageView.image = [UIImage stubInstrumentCellImage];
    }
    else {
        self.imageView.image = instrument.instrumentImage;
    }
}

@end
