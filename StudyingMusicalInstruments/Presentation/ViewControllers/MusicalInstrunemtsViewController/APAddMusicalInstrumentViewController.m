
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

@end

@implementation APAddMusicalInstrumentViewController

- (void)dealloc
{
    NSLog(@"APAddMusicalInstrumentViewController dealloc");
}

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
    if ([APMusicalInstrunemtValidator validateName:sender.text]) {
        sender.textColor = [UIColor blackColor];
        self.saveButton.enabled = YES;
    }
    else {
        sender.textColor = [UIColor redColor];
        self.saveButton.enabled = NO;
    }
}

- (void)actionSave:(UIBarButtonItem *)sender {
    if (![self.nameField.text isEqualToString:@""]) {
        APMusicalInstrument *newInstrument =
        [APMusicalInstrunemtFactory instrumentWithName:self.nameField.text
                                           description:self.descriptionField.text
                                                  type:APInstrumentsTypeWind
                                                 image:nil];
        [APMusicalInstrumentsManager saveInstrument:newInstrument];
    }
    [self.delegate didSaved:self];
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
