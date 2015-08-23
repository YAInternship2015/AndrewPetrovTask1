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

@interface APMusicalInstrumentsCollectionViewController ()

@property (nonatomic, strong) APMusicInstrumentsDataSource *allMusicalInstruments;
@property (nonatomic, weak) id<APMusicalInstrumentsCollectionViewControllerDelegate> delegate;


@end

@implementation APMusicalInstrumentsCollectionViewController
//- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

- (instancetype)initWithDelegate:(id<APMusicalInstrumentsCollectionViewControllerDelegate>)delegate
                          layout:(UICollectionViewLayout *)layout {
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.delegate = delegate;
        NSLog(@"init CollectionViewController");
    }
    return self;
}


- (void)viewDidLoad {
    NSLog(@"CollectionViewController DidLoad");
    [super viewDidLoad];
    self.allMusicalInstruments = [[APMusicInstrumentsDataSource alloc]initWithDelegate:self];
//    [APMusicalInstrumentsManager copyInstrumentPlistToMainBundle];
//    APMusicalInstrument *instrunent = [APMusicalInstrument instrumentWithName:@"aaa" description:@"bbb" type:1 image:nil];
    //    [APMusicalInstrumentsManager saveInstrument:instrunent];
    //    APMusicalInstrument *instrunent2 = [APMusicalInstrument instrumentWithName:@"aaa2" description:@"bbb2" type:1 image:nil];
    //    [APMusicalInstrumentsManager saveInstrument:instrunent2];
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

- (void)dataSourceIsUpdated {
    [self.collectionView reloadData];
}




@end
