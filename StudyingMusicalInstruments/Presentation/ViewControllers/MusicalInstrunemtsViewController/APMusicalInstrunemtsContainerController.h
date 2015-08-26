//
//  APMusicalInstrunemtsNavigationController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentsCollectionViewController.h"

@interface APMusicalInstrunemtsContainerController : UIViewController
<APAddMusicalInstrumentViewControllerDelegate>

- (void)addNewInstrument:(UIBarButtonItem *)sender;
- (void)toggleInstrumentsPresentation:(UIBarButtonItem *)sender;
- (void)didSaved:(APAddMusicalInstrumentViewController *)addController;

@end
