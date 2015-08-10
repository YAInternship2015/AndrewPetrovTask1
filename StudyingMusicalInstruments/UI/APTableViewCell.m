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

#warning (nonatomic, weak)
@property (weak, nonatomic) IBOutlet UIImageView *insrumentImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation APTableViewCell

#warning пустой метод
- (void)awakeFromNib {
    // Initialization code
}

#warning этот метод также можно удалить, ты в нем ничего не изменил по сравнению с оригинальной реализацией
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#warning По правилам именования методов если ты передаешь модель Instrument, то метод должен звучать setInstrument:
- (void) setModel:(APMusicalInstrument*) instrument{

    if (!instrument) {
        
        self.nameLabel.text = NSLocalizedString(@"stub_instrument_name", nil);
        self.descriptionLabel.text = @"";
        self.insrumentImageView.image = [UIImage stubInstrumentCellImage];
#warning здесь вместо return лучше было использовать if-else
        return;
    }
    
    self.nameLabel.text = instrument.name;
    self.descriptionLabel.text = instrument.instrumentDescription;
    self.insrumentImageView.image = instrument.instrumentImage;
}

@end
