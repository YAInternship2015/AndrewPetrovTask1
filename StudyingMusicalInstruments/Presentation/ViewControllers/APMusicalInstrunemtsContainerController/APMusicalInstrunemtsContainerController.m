//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtsContainerController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrunemtsTableViewController.h"
#import "APMusicalInstrumentsCollectionViewController.h"

static NSString * const AddInstrumentSegueIndentifier = @"AddInstrumentSegueIndentifier";

@interface APMusicalInstrunemtsContainerController () <APAddMusicalInstrumentViewControllerDelegate>

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (nonatomic, strong) UIImage *tableImage;
@property (nonatomic, strong) UIImage *collectionImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *togglePresentationButton;

@end

@implementation APMusicalInstrunemtsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:APMusicalInstrunemtsTableViewControllerIdentifier];
    self.collectionVC = [storyboard instantiateViewControllerWithIdentifier:APMusicalInstrumentsCollectionViewControllerIdentifier];
    self.tableImage = [UIImage imageNamed:@"list-simple-7"];
    self.collectionImage = [UIImage imageNamed:@"square-individual-nine-7"];
    self.togglePresentationImage = self.collectionImage;
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

- (void)changetogglePresentationButtonItemPicture {
    if ([self.childViewControllers lastObject] == self.collectionVC) {
        self.togglePresentationButton.image = self.tableImage;
    }
    else {
         self.togglePresentationButton.image = self.collectionImage;
    }
}

- (IBAction)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
    if ([[self.childViewControllers lastObject] isEqual:self.tableVC]) {
         [self displayContentController:self.collectionVC];
    }
    else {
         [self displayContentController:self.tableVC];
    }
    [self changetogglePresentationButtonItemPicture];
}

#pragma mark - APAddMusicalInstrumentViewControllerDelegate

- (void)addingCanceled {
//    here can be some other implementation
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didSaved:(APAddMusicalInstrumentViewController *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
