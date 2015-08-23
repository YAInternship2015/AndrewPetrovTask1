//
//  APMusicalInstrunemtsNavigationController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/22/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import "APMusicalInstrunemtsNavigationController.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentTableCell.h"
#import "APMusicalInstrumentsManager.h"

@interface APMusicalInstrunemtsNavigationController ()

@property (nonatomic, strong) APMusicalInstrunemtsTableViewController *tableVC;
@property (nonatomic, strong) APMusicalInstrumentsCollectionViewController *collectionVC;
@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;
@property (nonatomic, weak) UIView* currentClientView;

@end

@implementation APMusicalInstrunemtsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"APMusicalInstrunemtsNavigationController init");
    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
    
    /*UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumInteritemSpacing = 2;
    self.collectionVC = [[APMusicalInstrumentsCollectionViewController alloc] initWithDelegate:self
                                                                                        layout:flowLayout];
    [self.collectionVC.collectionView registerClass:[APMusicalInstrumentCollectionCell class] forCellWithReuseIdentifier:@"APCollectionViewCellIdentifier"];*/
    
    UIBarButtonItem* addNewInstrumentButtonItem = [[UIBarButtonItem alloc]
                                                   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                   target:nil
                                                   action:nil];

    self.navigationItem.rightBarButtonItem = addNewInstrumentButtonItem;
    self.navigationItem.title = @"aaaa";
    
    /*self.tableVC = [[APMusicalInstrunemtsTableViewController alloc] initWithStyle:UITableViewStylePlain
                                                                         delegate:self];
    [self.tableVC.tableView registerClass:[APMusicalInstrumentTableCell class]
                   forCellReuseIdentifier:APTableViewCellIdentifier];
    
    self.tableVC.tableView.backgroundColor = [UIColor redColor];
//    self.tableVC.navigationItem.leftBarButtonItems = self.navigationItem.leftBarButtonItems;
    self.currentClientView = self.tableVC.view;
    



    [self displayContentController:self.tableVC];*/
}


- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];                 
    content.view.frame = self.view.frame;
    [self.view addSubview:self.currentClientView];
    [content didMoveToParentViewController:self];
}


- (void)cycleFromViewController:(UIViewController *)oldC toViewController:(UIViewController *)newC {
    [oldC willMoveToParentViewController:nil];
    [self addChildViewController:newC];
    
    [oldC removeFromParentViewController];
    [newC didMoveToParentViewController:self];
}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    self.addVC = [APAddMusicalInstrumentViewController new];
    [self pushViewController:self.addVC animated:YES];
}

- (void)setCollectionView:(UIBarButtonItem *)sender {
    [self displayContentController:self.collectionVC];
}

@end
