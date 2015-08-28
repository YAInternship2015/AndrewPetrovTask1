//
//  APMusicalInstrumentCollectionCell.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APMusicalInstrument;

OBJC_EXTERN NSString * const APCollectionViewCellIdentifier;

@interface APMusicalInstrumentCollectionCell : UICollectionViewCell

- (void)setInstrument:(APMusicalInstrument *)instrument;

@end