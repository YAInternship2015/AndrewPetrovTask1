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

@interface APAddMusicalInstrumentViewController ()

@property (nonatomic, strong) APValidator *instrumentValidator;

@end


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
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return [APValidator validateName:textField.text];
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
@end
