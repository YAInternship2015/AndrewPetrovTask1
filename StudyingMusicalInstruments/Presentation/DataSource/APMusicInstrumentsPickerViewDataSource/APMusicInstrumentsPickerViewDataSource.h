//
//  APMusicInstrumentsPickerViewDataSource.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/24/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APMusicInstrumentsPickerViewDataSource : NSObject <UIPickerViewDataSource>

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

@end
