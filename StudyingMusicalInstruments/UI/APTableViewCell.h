//
//  APTableViewCell.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APMusicalInstrument;

extern NSString* const APTableViewCellIdentifier;


@interface APTableViewCell : UITableViewCell

- (void) setModel:(APMusicalInstrument*) instrument;

@end
