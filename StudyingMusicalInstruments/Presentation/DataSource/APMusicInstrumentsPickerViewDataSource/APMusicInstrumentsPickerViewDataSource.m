//
//  APMusicInstrumentsPickerViewDataSource.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 9/24/15.
//  Copyright © 2015 Андрей. All rights reserved.
//

#import "APMusicInstrumentsPickerViewDataSource.h"
#import "APMusicInstrumentsTypesDataSource.h"
#import "APInstrumentsType.h"

@interface APMusicInstrumentsPickerViewDataSource ()

@property (nonatomic, strong) APMusicInstrumentsTypesDataSource *allMusicalInstrumentsTypes;

@end

@implementation APMusicInstrumentsPickerViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.allMusicalInstrumentsTypes = [[APMusicInstrumentsTypesDataSource alloc] init];
    }
    return self;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.allMusicalInstrumentsTypes musicalInstrumentTypes].count;
}

@end
