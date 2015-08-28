//
//  APAddMusicalInstrumentViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h> 

@protocol APAddMusicalInstrumentViewControllerDelegate;

@interface APAddMusicalInstrumentViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id<APAddMusicalInstrumentViewControllerDelegate> delegate;

@end

@protocol APAddMusicalInstrumentViewControllerDelegate

- (void)musicalInstrumentDidSaved:(APAddMusicalInstrumentViewController *)sender;

@end
