//
//  APMusicalInstrumentCollectionCell.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APMusicalInstrument;

extern NSString *const APCollectionViewCellIdentifier;

@interface APMusicalInstrumentCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)setInstrument:(APMusicalInstrument *)instrument;

@end