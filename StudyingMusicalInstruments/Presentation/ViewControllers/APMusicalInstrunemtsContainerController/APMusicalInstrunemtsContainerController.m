//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtsContainerController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentsCollectionViewController.h"
#import "UIImage+StudyingMusicalInstruments.h"
#import "APMusicInstrumentsPresentationConstants.h"

@interface APMusicalInstrunemtsContainerController () <APAddMusicalInstrumentViewControllerDelegate>

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *togglePresentationButton;
@property (nonatomic, assign) BOOL transitionInProgress;

@end

@implementation APMusicalInstrunemtsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:APMusicalInstrunemtsTableViewControllerIdentifier];
    self.collectionVC = [storyboard
                         instantiateViewControllerWithIdentifier:APMusicalInstrumentsCollectionViewControllerIdentifier];
    
    self.togglePresentationImage = [UIImage collectionImage];
    self.navigationItem.title = NSLocalizedString(@"Musical_instruments", nil);
    
    [self displayContentController:self.tableVC];
    self.transitionInProgress = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:AddInstrumentSegueIndentifier]) {
        APAddMusicalInstrumentViewController *addInstrumentVC = segue.destinationViewController;
        addInstrumentVC.delegate = self;
    }
}

#pragma mark -

- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)swapViewController:(UIViewController *)oldVC toViewController:(UIViewController *)newVC {
    newVC.view.frame = self.view.bounds;
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    [self transitionFromViewController:oldVC
                      toViewController:newVC
                              duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:nil
                            completion:^(BOOL finished) {
                                [oldVC removeFromParentViewController];
                                [newVC didMoveToParentViewController:self];
                                self.transitionInProgress = NO;
    }];
}

- (void)updateTogglePresentationButtonItemPicture {
    if ([self.childViewControllers lastObject] == self.collectionVC) {
        self.togglePresentationButton.image = [UIImage tableImage];;
    }
    else {
         self.togglePresentationButton.image = [UIImage collectionImage];;
    }
}

- (IBAction)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
    if (self.transitionInProgress) {
        return;
    }
    self.transitionInProgress = YES;
    UIViewController *oldVC = [self.childViewControllers lastObject];
    if ([oldVC isEqual:self.tableVC]) {
         [self swapViewController:oldVC toViewController:self.collectionVC];
    }
    else {
         [self swapViewController:oldVC toViewController:self.tableVC];
    }
    [self updateTogglePresentationButtonItemPicture];
}

#pragma mark - APAddMusicalInstrumentViewControllerDelegate

- (void)musicalInstrumentDidSaved:(APAddMusicalInstrumentViewController *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
 
