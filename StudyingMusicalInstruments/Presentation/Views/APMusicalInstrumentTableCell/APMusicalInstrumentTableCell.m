//
//  APTableViewCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrument.h"
#import "UIImage+StudyingMusicalInstruments.h"

NSString *const APTableViewCellIdentifier = @"APTableViewCellIdentifier";

@interface APMusicalInstrumentTableCell ()

@property (nonatomic, weak) IBOutlet UIImageView *insrumentImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;

@end

@implementation APMusicalInstrumentTableCell

- (void)setInstrument:(APMusicalInstrument *)instrument {
    if (!instrument) {
        self.nameLabel.text = NSLocalizedString(@"stub_instrument_name", nil);
        self.descriptionLabel.text = @"";
    }
    else {
        self.nameLabel.text = instrument.name;
        self.descriptionLabel.text = instrument.instrumentDescription;
        self.insrumentImageView.image = instrument.instrumentImage;
    }
    if (!instrument.instrumentImage) {
        self.insrumentImageView.image = [UIImage stubInstrumentCellImage];
    }
}

@end
