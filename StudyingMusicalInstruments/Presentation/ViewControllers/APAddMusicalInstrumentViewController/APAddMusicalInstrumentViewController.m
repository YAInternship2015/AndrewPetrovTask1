
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
#import <MagicalRecord.h>
#import "APMusicalInstrumentNotifications.h"

@interface APAddMusicalInstrumentViewController () <
UIPickerViewDataSource,
UIPickerViewDelegate/*,
APMusicInstrumentsTypesDataSourceDelegate*/
>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, strong) APInstrumentsType *instrumentType;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsTypesDataSource *allMusicalInstrumentsTypes;
@property (nonatomic, strong) NSArray *musicalInstrumentsTypes;

@end

@implementation APAddMusicalInstrumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
    self.navigationItem.title = NSLocalizedString(@"Add_new_instrument", nil);
    self.musicalInstrumentsTypes =[self.allMusicalInstrumentsTypes musicalInstrumentTypes];
    NSLog(@"musicalInstrumentsTypes ++++++++++++ %@", self.musicalInstrumentsTypes);
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
    APInstrumentsType *type = (APInstrumentsType *)[self.allMusicalInstrumentsTypes musicalInstrumentTypes][0];
//    type.typeName = @"APInstrumentsTypeWind";
    //TODO: remove stump
    
    /*APMusicalInstrument *newInstrument =
    [APMusicalInstrumentFactory instrumentWithName:self.nameField.text
                                       description:self.descriptionField.text
                                              type:type
                                         imageName:nil];*/
    
    //TODO: move creating to APMusicalInstrumentsManager
    APMusicalInstrument *instrument = [APMusicalInstrument MR_createEntity];
    instrument.name = @"0000000000000";
    instrument.type = type;
    instrument.instrumentDescription = @"nnn";
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    [[NSNotificationCenter defaultCenter] postNotificationName: APModelDidChangeNotificaion object:nil];
    [self.delegate musicalInstrumentDidSaved:self];

    /*NSError *error = nil;
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
    }*/
    
    
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    NSLog(@"numberOfComponentsInPickerView");
    return 1;
}
//TODO: figure out with threads
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    /*NSLog(@"types count for picker ===== %u", self.musicalInstrumentsTypes.count);
     return self.musicalInstrumentsTypes.count;*/
    return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    /*NSLog(@"%@", ((APInstrumentsType *)self.musicalInstrumentsTypes[row]).typeName);
    return ((APInstrumentsType *)self.musicalInstrumentsTypes[row]).typeName;*/
    return @"bbbb";
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    /*NSLog(@"%@", self.musicalInstrumentsTypes);
    self.instrumentType = self.musicalInstrumentsTypes[row];
    self.typeField.text =  self.instrumentType.typeName;*/
}

@end
