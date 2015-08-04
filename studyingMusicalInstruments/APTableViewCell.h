//
//  APTableViewCell.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APMusicalInstrument;
static NSString* cellIdentifier = @"cell";


@interface APTableViewCell : UITableViewCell

- (void) takeInstrument:(APMusicalInstrument*) instrument;

@end
