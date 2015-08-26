//
//  APMusiInstrCollectionViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/21/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicalInstrumentsCollectionViewController.h"
#import "APMusicalInstrumentCollectionCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"
#import "APMusicInstrumentsDataSource.h"

NSString* const APMusicalInstrumentsCollectionViewControllerIdentifier = @"APMusicalInstrumentsCollectionViewControllerIdentifier";

@interface APMusicalInstrumentsCollectionViewController ()

@property (nonatomic, strong) APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrumentsCollectionViewController

- (void)viewDidLoad {
    NSLog(@"CollectionViewController DidLoad");
    [super viewDidLoad];
    self.allMusicalInstruments = [[APMusicInstrumentsDataSource alloc]initWithDelegate:self];
}

- (void)loadView {
    NSLog(@"CollectionViewController loadView");
    [super loadView];

}

- (void)dealloc {
    NSLog(@"CollectionViewController dealloc");
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstrumentsCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    APMusicalInstrumentCollectionCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:APCollectionViewCellIdentifier
                                              forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}



#pragma mark - APMusicInstrumentsDataSourceDelegate

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource {
    [self.collectionView reloadData];
}


@end
