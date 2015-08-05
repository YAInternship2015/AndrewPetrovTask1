//
//  APTableViewCell.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APTableViewCell.h"
#import "APMusicalInstrument.h"

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

    // Configure the view for the selected state
}
- (void) takeInstrument:(APMusicalInstrument*) instrument{
    
    if (self.contentView){
        NSLog(@"contentView exist");
    }
    
    self.nameLabel.text = instrument.name;
    self.descriptionLabel.text = instrument.instrumentDescription;
    self.nameLabel.text = @"test text";
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.backgroundColor = [UIColor redColor];
    self.insrumentImageView.image = instrument.instrumentImage;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSLog(@"Cell created");
    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
}
@end
