//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

//TODO - delete root viewcontroller link and add navigation without it
#import "APMusicalInstrunemtsNavigationController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrumentsManager.h"

@interface APMusicalInstrunemtsNavigationController ()

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;
@property (nonatomic, strong) UIViewController* currentClientViewController;

@end

@implementation APMusicalInstrunemtsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"APMusicalInstrunemtsNavigationController init");
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrunemtsTableViewController"];
    self.collectionVC = [storyboard instantiateViewControllerWithIdentifier:@"APMusicalInstrumentsCollectionViewController"];
    self.addVC = [storyboard instantiateViewControllerWithIdentifier:@"APAddMusicalInstrumentViewController"];
    
    
        
//    self.tableVC.tableView.backgroundColor = [UIColor redColor];

    self.currentClientViewController = self.tableVC;
    
    UIBarButtonItem* addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self
                                                   action:@selector(addNewInstrument:)];
    UIBarButtonItem* setCollectionViewButtonItem = [[UIBarButtonItem alloc]
                                                    initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                    target:self
                                                    action:@selector(setCollectionView:)];
     ((UIViewController *)self.childViewControllers.lastObject).navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, setCollectionViewButtonItem];
    
    [self displayContentController:self.currentClientViewController];
}


- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];                 
    content.view.frame = self.view.frame;
    [self.view addSubview:self.currentClientViewController.view];
    [content didMoveToParentViewController:self];
}

//todo to figure out with this stuff
- (void)cycleFromViewController:(UIViewController *)oldC toViewController:(UIViewController *)newC {
    NSLog(@"cycleFromViewController");
    [oldC willMoveToParentViewController:nil];
    [self addChildViewController:newC];
    
    [oldC removeFromParentViewController];
    [newC didMoveToParentViewController:self];
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    self.addVC = [APAddMusicalInstrumentViewController new];
    [self cycleFromViewController:((UIViewController *)self.childViewControllers.lastObject) toViewController:self.addVC];
}

- (void)setCollectionView:(UIBarButtonItem *)sender {
    [self displayContentController:self.collectionVC];
}

@end
