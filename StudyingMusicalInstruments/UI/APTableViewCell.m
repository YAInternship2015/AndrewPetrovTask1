//
//  APTableViewCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APTableViewCell.h"
#import "APMusicalInstrument.h"
#import "UIImage+StudyingMusicalInstruments.h"

NSString* const APTableViewCellIdentifier = @"APTableViewCellIdentifier";

@interface APTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *insrumentImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation APTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void) setModel:(APMusicalInstrument*) instrument{

    if (!instrument) {
        
        self.nameLabel.text = NSLocalizedString(@"no_instrument", nil);
        self.descriptionLabel.text = @"";
        self.insrumentImageView.image = [UIImage cellStumbImage];
        return;
    }
    
    self.nameLabel.text = instrument.name;
    self.descriptionLabel.text = instrument.instrumentDescription;
    self.insrumentImageView.image = instrument.instrumentImage;
}

@end
