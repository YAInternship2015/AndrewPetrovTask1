//
//  APAddMusicalInstrumentViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APAddMusicalInstrumentViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
- (IBAction)actionCheckName:(UITextField *)sender;
- (IBAction)actionSave:(UIButton *)sender;

@end
