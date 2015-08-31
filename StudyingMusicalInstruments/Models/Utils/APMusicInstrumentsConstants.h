//
//  APMusicInstrumentsConstants.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/28/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#ifndef StudyingMusicalInstruments_APMusicInstrumentsConstants_h
#define StudyingMusicalInstruments_APMusicInstrumentsConstants_h

static NSString * const APAddMusicalInstrumentViewControllerIdentifier = @"APAddMusicalInstrumentViewControllerIdentifier";
static NSString * const APPickerViewSegueIndentifier = @"APPickerViewSegueIndentifier";
static NSString * const APCollectionViewCellIdentifier = @"APCollectionViewCellIdentifier";
static NSString * const APMusicalInstrumentsCollectionViewControllerIdentifier = @"APMusicalInstrumentsCollectionViewControllerIdentifier";
static NSString * const APTableViewCellIdentifier = @"APTableViewCellIdentifier";
static NSString * const AddInstrumentSegueIndentifier = @"AddInstrumentSegueIndentifier";
static NSString * const APMusicalInstrunemtsTableViewControllerIdentifier = @"APMusicalInstrunemtsTableViewControllerIdentifier";

static const NSInteger APMusicalInstrumentNameMinLength = 3;
static const NSInteger APMusicalInstrumentStrongNameMinLength = 5;

static const NSInteger APMusicalInstrumentNameValidationLengthError = 42;
static const NSInteger APMusicalInstrumentTypeValidationLengthError = 43;
static NSString * const APMusicalInstrunemtDomain = @"APMusicalInstrunemtDomain";


static NSString * const APMusicalInstrumentNameKey = @"name";
static NSString * const APMusicalInstrumentDescriptionKey = @"description";
static NSString * const APMusicalInstrumentTypeKey = @"type";
static NSString * const APMusicalInstrumentImageKey = @"image";
static NSString * const APInstrumentsPlistKey = @"instruments";
static NSString * const APTypesPlistKey = @"instrument_types";

#endif
