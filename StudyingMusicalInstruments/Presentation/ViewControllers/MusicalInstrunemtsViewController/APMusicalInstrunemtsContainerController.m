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

@interface APMusicalInstrunemtsContainerController ()

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (nonatomic, strong) UIImage *tableImage;
@property (nonatomic, strong) UIImage *collectionImage;
@property (nonatomic, strong) UIBarButtonItem *togglePresentationButtonItem;

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
    

    UIBarButtonItem *addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self
                                                   action:@selector(addNewInstrument:)];
    self.togglePresentationButtonItem = [[UIBarButtonItem alloc]
                                         initWithImage:self.togglePresentationImage
                                         style:UIBarButtonItemStyleDone
                                         target:self
                                         action:@selector(toggleInstrumentsPresentation:)];
//
    self.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, self.togglePresentationButtonItem];
    self.navigationItem.title = NSLocalizedString(@"Musical_instruments", nil);

    [self displayContentController:self.tableVC];
    
}


- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)changetogglePresentationButtonItemPicture {
    if (self.togglePresentationButtonItem.image == self.collectionImage) {
        self.togglePresentationButtonItem.image = self.tableImage;
    }
    else {
         self.togglePresentationButtonItem.image = self.collectionImage;
    }
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.addVC = [storyboard instantiateViewControllerWithIdentifier:APAddMusicalInstrumentViewControllerIdentifier];
    self.addVC.delegate = self;
    [self.navigationController pushViewController:self.addVC animated:YES];
}

- (void)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
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

- (void)didSaved:(APAddMusicalInstrumentViewController *)addController {
    [self.navigationController popViewControllerAnimated:YES];
}

                                                     
                                                     
@end
