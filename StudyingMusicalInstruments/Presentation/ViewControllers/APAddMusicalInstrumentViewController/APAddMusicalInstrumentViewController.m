
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
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicalInstrument.h"

NSString* const APAddMusicalInstrumentViewControllerIdentifier = @"APAddMusicalInstrumentViewControllerIdentifier";

NSString* const APPickerViewSegueIndentifier = @"APPickerViewSegueIndentifier";

@interface APAddMusicalInstrumentViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, assign) APInstrumentsType newInstrumentType;

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
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.typeField.inputView = pickerView;
}

- (IBAction)instrumetnNameDidChangeInTextFiedl:(UITextField *)sender {
    
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
    if ([APMusicalInstrunemtValidator validateName:self.nameField.text error:nil]) {
        APMusicalInstrument *newInstrument =
        [APMusicalInstrunemtFactory instrumentWithName:self.nameField.text
                                           description:self.descriptionField.text
                                                  type:self.newInstrumentType
                                             imageName:nil];
        NSError *error = nil;
        if (![APMusicalInstrunemtValidator validateInstrument:newInstrument error:&error]) {
            [[[UIAlertView alloc] initWithTitle:error.localizedDescription
                                        message:error.localizedRecoverySuggestion
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                              otherButtonTitles:nil, nil] show];
        }
        else {
            [APMusicalInstrumentsManager saveInstrument:newInstrument];
            [self.delegate musicalInstrumentDidSaved:self];
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

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSArray *typesArray =
    [[NSArray alloc] initWithArray:(NSArray *)dictionary[APTypesPlistKey]];
    
    return typesArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *plistPath = [NSFileManager instrumentsPlistPath];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSArray *typesArray =
    [[NSArray alloc] initWithArray:(NSArray *)dictionary[APTypesPlistKey]];
    
    return NSLocalizedString(typesArray[row], nil);
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.newInstrumentType = row;
    self.typeField.text = [self pickerView:pickerView titleForRow:row forComponent:component];
}

@end
