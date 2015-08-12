//
//  APTableViewCell.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

//#warning За предекларацию - зачёт )
@class APMusicalInstrument;

//#warning по фен-шую * должна быть возле const, то есть NSString *const
extern NSString *const APTableViewCellIdentifier;

@interface APMusicalInstrumentCell : UITableViewCell

//#warning Почитай наши гайды по отступам, вроде мелочь, но очень важная https://github.com/Yalantis/iOS-Guidelines
- (void)setInstrument:(APMusicalInstrument *)instrument;

@end
