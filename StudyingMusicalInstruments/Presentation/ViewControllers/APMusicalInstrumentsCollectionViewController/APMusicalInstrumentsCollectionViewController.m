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
#import "APMusicInstrumentsDataSource.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicInstrumentsPresentationConstants.h"

@interface APMusicalInstrumentsCollectionViewController () /*<APMusicInstrumentsDataSourceDelegate>*/

@property (nonatomic, strong) IBOutlet APMusicInstrumentsDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrumentsCollectionViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstruments].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    APMusicalInstrumentCollectionCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:APCollectionViewCellIdentifier
                                              forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstruments][indexPath.row]];
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
