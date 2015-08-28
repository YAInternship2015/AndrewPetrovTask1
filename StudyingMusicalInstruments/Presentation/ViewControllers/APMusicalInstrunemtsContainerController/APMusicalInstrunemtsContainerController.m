//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtsContainerController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentsCollectionViewController.h"
#import "NSFileManager+APMusicalInstrumentsManager.h"
#import "UIImage+StudyingMusicalInstruments.h"

static NSString * const AddInstrumentSegueIndentifier = @"AddInstrumentSegueIndentifier";

@interface APMusicalInstrunemtsContainerController () <APAddMusicalInstrumentViewControllerDelegate>

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *togglePresentationButton;

@end

@implementation APMusicalInstrunemtsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:APMusicalInstrunemtsTableViewControllerIdentifier];
    self.collectionVC = [storyboard instantiateViewControllerWithIdentifier:APMusicalInstrumentsCollectionViewControllerIdentifier];
    
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
