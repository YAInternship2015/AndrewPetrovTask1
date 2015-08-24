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

//    self.currentClientViewController = self.tableVC;
    
    UIBarButtonItem* addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:self
                                                   action:@selector(addNewInstrument:)];
    UIBarButtonItem* setCollectionViewButtonItem = [[UIBarButtonItem alloc]
                                                    initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                                    target:self
                                                    action:@selector(setCollectionView:)];
     self.topViewController.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, setCollectionViewButtonItem];
    
//    self.currentClientViewController.navigationItem.rightBarButtonItems = @[addNewInstrumentButtonItem, setCollectionViewButtonItem];

    
//    NSLog(@"\n%@\n%@\n%@",self.currentClientViewController, self.topViewController, self.tableVC);
    [self displayContentController:self.tableVC];
}


- (void)displayContentController:(UIViewController *)content {
    NSLog(@"displayContentController");
    
    [self addChildViewController:content];                 
    content.view.frame = self.view.frame;
    [self.view addSubview:self.currentClientViewController.view];
    [content didMoveToParentViewController:self];
}

//todo to figure out with this stuff
- (void)cycleFromViewController:(UIViewController *)oldC toViewController:(UIViewController *)newC {
    NSLog(@"cycleFromViewController");
//    oldC = (UIViewController *)self.childViewControllers.lastObject;
//    newC = self.collectionVC;
    
    [oldC willMoveToParentViewController:nil];
    [oldC.view removeFromSuperview];
    [oldC removeFromParentViewController];
//    [self addChildViewController:newC];
    
    
//    [previousViewController willMoveToParentViewController:nil];
//    [previousViewController.view removeFromSuperview];
//    [previousViewController removeFromParentViewController];
//
    [self addChildViewController:newC];
    [self.view addSubview:newC.view];
    [newC didMoveToParentViewController:self];
    


//    [oldC removeFromParentViewController];
//    [newC didMoveToParentViewController:self];
    
//    [self addChildViewController:viewController];
//    self.viewController.view.frame = self.view.bounds;
//    self.viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self.view addSubview:self.viewController.view];
//    [self.viewController didMoveToParentViewController:self];
//    
//    
    
    /*newC.view.frame = self.view.frame;
    CGRect endFrame;
    endFrame.origin.x = 0;
    endFrame.origin.y = 0;
    endFrame.size.height = 200;
    endFrame.size.width = 200;
    
    [self transitionFromViewController: oldC toViewController: newC
                              duration: 0.25 options:0
                            animations:^{
                                newC.view.frame = oldC.view.frame;                    
                                oldC.view.frame = endFrame;
                            }
                            completion:^(BOOL finished) {
                                [oldC removeFromParentViewController];
                                [newC didMoveToParentViewController:self];
                            }];*/
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    self.addVC = [APAddMusicalInstrumentViewController new];
    [self cycleFromViewController:((UIViewController *)self.childViewControllers.lastObject) toViewController:self.addVC];
}

- (void)setCollectionView:(UIBarButtonItem *)sender {
    [self cycleFromViewController:self.topViewController toViewController:self.collectionVC];
}

@end
