
//  APAddMusicalInstrumentViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrunemtValidator.h"
#import "APMusicalInstrunemtFactory.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

NSString* const APAddMusicalInstrumentViewControllerIdentifier = @"APAddMusicalInstrumentViewControllerIdentifier";

@interface APAddMusicalInstrumentViewController ()

@property (nonatomic, strong) UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;

@end

@implementation APAddMusicalInstrumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.delegate = self;
    self.descriptionField.delegate = self;
    self.typeField.delegate = self;
    [self.nameField becomeFirstResponder];
    self.navigationItem.title = NSLocalizedString(@"Add_new_instrument", nil);
    self.saveButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", nil)
                                                       style:UIBarButtonItemStylePlain
                                                      target:self
                                                      action:@selector(actionSave:)];
    self.saveButton.enabled = NO;
    self.navigationItem.rightBarButtonItem = self.saveButton;
}

- (IBAction)actionCheckName:(UITextField *)sender {
    
    if (sender.text.length < 3) {
        sender.textColor = [UIColor redColor];
        self.saveButton.enabled = NO;
    }
    else if (sender.text.length > 4) {
        sender.textColor = [UIColor blackColor];
        self.saveButton.enabled = YES;
    }
    else {
        sender.textColor = [UIColor grayColor];
        self.saveButton.enabled = YES;
    }
}

- (void)actionSave:(UIBarButtonItem *)sender {
    if (![self.nameField.text isEqualToString:@""]) {
        NSError *error = nil;
        [APMusicalInstrunemtValidator validateName:self.nameField.text
                                             error:&error];
        if (error) {
            [[[UIAlertView alloc] initWithTitle:error.localizedDescription
                                        message:error.localizedRecoverySuggestion
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                              otherButtonTitles:nil, nil] show];
        }
        else {
            APMusicalInstrument *newInstrument =
            [APMusicalInstrunemtFactory instrumentWithName:self.nameField.text
                                               description:self.descriptionField.text
                                                      type:APInstrumentsTypeWind
                                                     image:nil];
            [APMusicalInstrumentsManager saveInstrument:newInstrument];
            [self.delegate didSaved:self];
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField.returnKeyType == UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag + 1];
        [next becomeFirstResponder];
    }
    else if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }

    return YES;
}


@end
