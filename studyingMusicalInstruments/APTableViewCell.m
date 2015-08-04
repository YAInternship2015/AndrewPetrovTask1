//
//  APTableViewCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APTableViewCell.h"
#import "APMusicalInstrument.h"



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

    // Configure the view for the selected state
}
- (void) takeInstrument:(APMusicalInstrument*) instrument{
    
    self.nameLabel.text = instrument.name;
    self.descriptionLabel.text = instrument.instrumentDescription;
    self.nameLabel.textColor = [UIColor blackColor];
    self.imageView.image = instrument.instrumentImage;
}


@end
