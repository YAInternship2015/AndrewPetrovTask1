
//  APAddMusicalInstrumentViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentValidator.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicInstrumentsTypesDataSource.h"
#import "APMusicInstrumentsPickerViewDataSource.h"
#import "APInstrumentsType.h"

@interface APAddMusicalInstrumentViewController () <UIPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *typeField;
@property (nonatomic, weak) IBOutlet UITextField *descriptionField;
@property (nonatomic, strong) APInstrumentsType *instrumentType;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsTypesDataSource *allMusicalInstrumentsTypes;
@property (nonatomic, strong) IBOutlet APMusicInstrumentsPickerViewDataSource *pickerDataSource;

@end

@implementation APAddMusicalInstrumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameField becomeFirstResponder];
    self.navigationItem.title = NSLocalizedString(@"Add_new_instrument", nil);
    [self createPicker];
//#warning создание пикера вынесите в отдельный метод

}

- (void)createPicker {
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self.pickerDataSource;
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

//#warning saveButtonTouchedUpInside:
- (IBAction)saveButtonTouchedUpInside:(UIBarButtonItem *)sender {
    NSError *error = nil;
    if ([APMusicalInstrumentValidator validateName:self.nameField.text error:&error]) {
        [APMusicalInstrumentValidator validateType:self.instrumentType error:&error];
    }
    if (error) {
        [[[UIAlertView alloc] initWithTitle:error.localizedDescription
                                    message:error.localizedRecoverySuggestion
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil, nil] show];
    }
    else {
        [APMusicalInstrumentsManager createInstrumentWithName:self.nameField.text
                                                  description:self.descriptionField.text
                                                         type:self.instrumentType
                                                    imageName:nil];
//#warning переход обратно можно делать и самостоятельно, без привлечения делегата
        
// вот здесь у меня вопрос. это вроде стандартная ситуация - оповестить делегата.через этот делегат можно добавить логику, и если приложение разростется, то , как мне кажется, этот делегат будет необходим, например можно туда добавить показ сообщения об успешном выполнении добавления. хотя, конечно, при данном функционале, он лишний. может стоит его остаить?

        [self.delegate musicalInstrumentDidSaved:self];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//#warning работа с тегами - плозая практика. Если нужно проходить по всем инпутам, проведите из сториборды IBOutletCollection и проходите по нему
    if (textField.returnKeyType == UIReturnKeyNext) {
        if ([textField isEqual:self.nameField]) {
            [self.typeField becomeFirstResponder];
        }
        if ([textField isEqual:self.typeField]) {
            [self.descriptionField becomeFirstResponder];
        }
    }
    else if (textField.returnKeyType == UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}

//#warning датасорс пикера надо вынести в отдельный класс, он не особо пересекается с вью контроллером.

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.instrumentType = [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row];
    self.typeField.text =  NSLocalizedString(((APInstrumentsType *)
                                              [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row]).typeName, nil);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSLog(@"%@", ((APInstrumentsType *)
                  [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row]).typeName);
    return NSLocalizedString(((APInstrumentsType *)
                              [self.allMusicalInstrumentsTypes musicalInstrumentTypes][row]).typeName, nil);
}



@end
