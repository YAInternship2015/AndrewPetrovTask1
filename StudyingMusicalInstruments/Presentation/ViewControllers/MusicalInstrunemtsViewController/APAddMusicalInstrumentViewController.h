//
//  APAddMusicalInstrumentViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol APAddMusicalInstrumentViewControllerDelegate;

extern NSString *const APAddMusicalInstrumentViewControllerIdentifier;

@interface APAddMusicalInstrumentViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
- (IBAction)actionCheckName:(UITextField *)sender;
- (IBAction)actionSave:(UIButton *)sender;
@property (nonatomic, weak) id<APAddMusicalInstrumentViewControllerDelegate>delegate;
@end

@protocol APAddMusicalInstrumentViewControllerDelegate

- (void)didSaved:(APAddMusicalInstrumentViewController *)addController;

@end
