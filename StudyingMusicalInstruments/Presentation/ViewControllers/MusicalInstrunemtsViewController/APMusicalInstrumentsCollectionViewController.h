//
//  APMusiInstrCollectionViewController.h
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/21/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMusicInstrumentsDataSource.h"
#import "APAddMusicalInstrumentViewController.h"

extern NSString *const APMusicalInstrumentsCollectionViewControllerIdentifier;

@interface APMusicalInstrumentsCollectionViewController : UICollectionViewController
<APMusicInstrumentsDataSourceDelegate>

- (void)dataSourceIsUpdated:(APMusicInstrumentsDataSource *)dataSource;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

@end
