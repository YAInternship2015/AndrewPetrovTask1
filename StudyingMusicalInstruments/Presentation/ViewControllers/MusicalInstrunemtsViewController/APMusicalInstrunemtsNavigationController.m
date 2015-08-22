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

@interface APMusicalInstrunemtsNavigationController ()

@property (nonatomic, strong) APAddMusicalInstrumentViewController *addVC;

@end

@implementation APMusicalInstrunemtsNavigationController

- (void)viewDidLoad {
    NSLog(@"APMusicalInstrunemtsNavigationController viewDidLoad");
    self.tableVC = [[APMusicalInstrunemtsTableViewController alloc] initWithDelegate:self];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.minimumInteritemSpacing = 2;
    self.collectionVC = [[APMusicalInstrumentsCollectionViewController alloc] initWithDelegate:self
                                                                                        layout:flowLayout];
    [self.collectionVC.collectionView registerClass:[APMusicalInstrumentCollectionCell class] forCellWithReuseIdentifier:@"APCollectionViewCellIdentifier"];

}

#pragma mark - APMusicalInstrunemtsTableViewController

- (void)addNewInstrument:(UIBarButtonItem *)sender {
    self.addVC = [APAddMusicalInstrumentViewController new];
    [self pushViewController:self.addVC animated:YES];
}

- (void)setCollectionView:(UIBarButtonItem *)sender {
    [self pushViewController:self.collectionVC animated:YES];
}

@end
