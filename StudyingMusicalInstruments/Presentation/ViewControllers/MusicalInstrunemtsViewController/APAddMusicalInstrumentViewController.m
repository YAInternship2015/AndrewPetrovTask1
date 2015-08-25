//
//  APAddMusicalInstrumentViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAddMusicalInstrumentViewController.h"
#import "APValidator.h"
#import "APMusicalInstrunemtFactory.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

@implementation APAddMusicalInstrumentViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"APAddMusicalInstrumentViewController init");
    }
    return self;
}

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
}


- (IBAction)actionCheckName:(UITextField *)sender {
    if ([APValidator validateName:sender.text]) {
        sender.textColor = [UIColor blackColor];
    }
    else {
        sender.textColor = [UIColor redColor];
    }
}

- (IBAction)actionSave:(UIButton *)sender {
    APMusicalInstrument *newInstrument =
    [APMusicalInstrunemtFactory instrumentWithName:self.nameField.text
                                       description:self.descriptionField.text
                                              type:APInstrumentsTypeWind
                                             image:nil];
    [APMusicalInstrumentsManager saveInstrument:newInstrument];
    [self.navigationController popViewControllerAnimated:self];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return [APValidator validateName:textField.text];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.returnKeyType == UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag + 1];
        [next becomeFirstResponder];
    }
    else if (textField.returnKeyType == UIReturnKeyDone){
        [textField resignFirstResponder];
    }

    return YES;
}



@end
