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
    
//    [self transitionFromViewController:oldVC toViewController:newVC
//                              duration:0.25
//                               options:UIViewAnimationOptionTransitionFlipFromLeft];

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
    if ([[self.childViewControllers lastObject] isEqual:self.tableVC]) {
         [self displayContentController:self.collectionVC];
    }
    else {
         [self displayContentController:self.tableVC];
    }
    [self updateTogglePresentationButtonItemPicture];
}

#pragma mark - APAddMusicalInstrumentViewControllerDelegate

- (void)musicalInstrumentDidSaved:(APAddMusicalInstrumentViewController *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end


/*- (void)cycleFromViewController:(UIViewController *)oldController toViewController:(UIViewController *)newController {
    [oldController willMoveToParentViewController:nil];
    [self addChildViewController:newController];
    float animationTimeInSeconds = 0.2;
    
    [self transitionFromViewController:oldController toViewController:newController
                              duration:animationTimeInSeconds
                               options:0
                            animations:^{
                                newController.view.alpha = 1.f;
                                oldController.view.alpha = 0.f;
                            }
                            completion:^(BOOL finished) {
                                [oldController removeFromParentViewController];
                                [newController didMoveToParentViewController:self];
                            }];
    
}*/
