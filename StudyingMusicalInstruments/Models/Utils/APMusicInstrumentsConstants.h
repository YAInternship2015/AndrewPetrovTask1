//
//  APMusicInstrumentsConstants.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/28/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#ifndef StudyingMusicalInstruments_APMusicInstrumentsConstants_h
#define StudyingMusicalInstruments_APMusicInstrumentsConstants_h

NSString * const APAddMusicalInstrumentViewControllerIdentifier = @"APAddMusicalInstrumentViewControllerIdentifier";
NSString * const APPickerViewSegueIndentifier = @"APPickerViewSegueIndentifier";
NSString * const APCollectionViewCellIdentifier = @"APCollectionViewCellIdentifier";
NSString * const APMusicalInstrumentsCollectionViewControllerIdentifier = @"APMusicalInstrumentsCollectionViewControllerIdentifier";
NSString * const APTableViewCellIdentifier = @"APTableViewCellIdentifier";
NSString * const AddInstrumentSegueIndentifier = @"AddInstrumentSegueIndentifier";
NSString * const APMusicalInstrunemtsTableViewControllerIdentifier = @"APMusicalInstrunemtsTableViewControllerIdentifier";

const NSInteger APMusicalInstrumentNameMinLength = 3;
const NSInteger APMusicalInstrumentStrongNameMinLength = 5;

const NSInteger APMusicalInstrumentNameValidationLengthError = 42;
const NSInteger APMusicalInstrumentTypeValidationLengthError = 43;
NSString * const APMusicalInstrunemtDomain = @"APMusicalInstrunemtDomain";


NSString * const APMusicalInstrumentNameKey = @"name";
NSString * const APMusicalInstrumentDescriptionKey = @"description";
NSString * const APMusicalInstrumentTypeKey = @"type";
NSString * const APMusicalInstrumentImageKey = @"image";
NSString * const APInstrumentsPlistKey = @"instruments";
NSString * const APTypesPlistKey = @"instrument_types";

#endif
