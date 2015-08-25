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
    NSLog(@"APMusicalInstrunemtsNavigationController init");
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrunemtsTableViewController"];
    self.collectionVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrumentsCollectionViewController"];
    self.addVC = [storyboard instantiateViewControllerWithIdentifier:@"APAddMusicalInstrumentViewController"];
    NSLog(@"\n-------table\n%@\n-------collection\n%@\n-------add\n%@",self.tableVC, self.collectionVC, self.addVC);
    NSLog(@"\nTop\n%@\ntableVC\n%@\n%@",self.navigationController.topViewController, self.tableVC, self.navigationController.viewControllers);
    
    UIBarButtonItem *addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self
                                                   action:@selector(addNewInstrument:)];
    UIBarButtonItem *togglePresentationButtonItem = [[UIBarButtonItem alloc]
                                                    initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                    target:self
                                                    action:@selector(toggleInstrumentsPresentation:)];
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    self.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, togglePresentationButtonItem];
    self.navigationItem.title = @"Musical Instrunemts";

    
    NSLog(@"\nTop\n%@\ntableVC\n%@\n%@",self.navigationController.topViewController, self.tableVC, self.navigationController.viewControllers);
    
    [self displayContentController:self.tableVC];
    
}


- (void)displayContentController:(UIViewController *)content {
    NSLog(@"displayContentController");
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)cycleFromViewController:(UIViewController *)oldC toViewController:(UIViewController *)newC {
    [oldC willMoveToParentViewController:nil];
    [oldC.view removeFromSuperview];
    [oldC removeFromParentViewController];

    
    [self addChildViewController:newC];
    newC.view.frame = self.view.frame;
    [self.view addSubview:newC.view];
    [newC didMoveToParentViewController:self];
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    [self.navigationController pushViewController:self.addVC animated:YES];
}

- (void)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
    if ([[self.childViewControllers lastObject] isEqual:self.tableVC]) {
        [self cycleFromViewController:self.tableVC toViewController:self.collectionVC];
    }
    else {
        [self cycleFromViewController:self.collectionVC toViewController:self.tableVC];
        
    }
}

@end
