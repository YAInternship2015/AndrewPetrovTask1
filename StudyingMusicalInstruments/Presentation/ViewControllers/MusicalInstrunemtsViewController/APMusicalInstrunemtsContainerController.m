//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

//TODO - delete root viewcontroller link and add navigation without it
#import "APMusicalInstrunemtsContainerController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrumentsManager.h"

@interface APMusicalInstrunemtsContainerController ()

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;
@property (nonatomic, strong) UIViewController* currentClientViewController;

@end

@implementation APMusicalInstrunemtsContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrunemtsTableViewController"];
    self.collectionVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrumentsCollectionViewController"];
    self.addVC = [storyboard instantiateViewControllerWithIdentifier:@"APAddMusicalInstrumentViewController"];

    UIBarButtonItem *addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self
                                                   action:@selector(addNewInstrument:)];
    UIBarButtonItem *togglePresentationButtonItem = [[UIBarButtonItem alloc]
                                                    initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                    target:self
                                                    action:@selector(toggleInstrumentsPresentation:)];
    self.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, togglePresentationButtonItem];
    self.navigationItem.title = @"Musical Instrunemts";

    [self displayContentController:self.tableVC];
}


- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    [self.navigationController pushViewController:self.addVC animated:YES];
}

- (void)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
    if ([[self.childViewControllers lastObject] isEqual:self.tableVC]) {
         [self displayContentController:self.collectionVC];
    }
    else {
         [self displayContentController:self.tableVC];
    }
}

@end
