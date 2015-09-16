
//  APAddMusicalInstrumentViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentValidator.h"
#import "APMusicalInstrumentFactory.h"
#import "APMusicalInstrumentsManager.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsDataSource.h"
#import "APMusicInstrumentsTypesDataSource.h"
#import "APInstrumentsType.h"

@interface APAddMusicalInstrumentViewController () <UIPickerViewDataSource, UIPickerViewDelegate/*,APMusicInstrumentsDataSourceDelegate*/>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, strong) APInstrumentsType *instrumentType;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsTypesDataSource *allMusicalInstrumentsTypes;


@end

@implementation APAddMusicalInstrumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
    self.navigationItem.title = NSLocalizedString(@"Add_new_instrument", nil);
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.typeField.inputView = pickerView;
}

- (IBAction)instrumetnNameDidChangeInTextField:(UITextField *)sender {
    if (![APMusicalInstrumentValidator validateName:sender.text error:nil]) {
        sender.textColor = [UIColor redColor];
        self.saveButton.enabled = NO;
    }
    else if (![APMusicalInstrumentValidator isInstrumentNameStrongEnough:sender.text]) {
        sender.textColor = [UIColor grayColor];
        self.saveButton.enabled = YES;
    }
    else {
        sender.textColor = [UIColor blackColor];
        self.saveButton.enabled = YES;
    }
}

- (IBAction)actionSave:(UIBarButtonItem *)sender {
    APInstrumentsType *type = [[APInstrumentsType alloc] init];
//    type.typeName = @"APInstrumentsTypeWind";
//    [type setTypeName:@"APInstrumentsTypeWind"];
    [type setValue:@"APInstrumentsTypeWind" forKey:@"typeName"];
    //TODO: remove stump
    APMusicalInstrument *newInstrument =
    [APMusicalInstrumentFactory instrumentWithName:self.nameField.text
                                       description:self.descriptionField.text
                                              type:type
                                         imageName:nil];
    NSError *error = nil;
    if (![APMusicalInstrumentValidator validateInstrument:newInstrument error:&error]) {
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

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//#warning решение с тегами может и простое, но не самое элегантное. Но пока сойдет
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

//#warning по уму, если мы выносили датасорс тадицы и коллекшн вью из контроллера, то датасорс пикера также стоило вынести в отдельный класс
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSLog(@"%u", [self.allMusicalInstrumentsTypes musicalInstrumentTypes].count);
     return [self.allMusicalInstrumentsTypes musicalInstrumentTypes].count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%@", [self.allMusicalInstrumentsTypes musicalInstrumentTypes]);
    self.instrumentType = [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row];
    self.typeField.text =  self.instrumentType.typeName;
}

@end
