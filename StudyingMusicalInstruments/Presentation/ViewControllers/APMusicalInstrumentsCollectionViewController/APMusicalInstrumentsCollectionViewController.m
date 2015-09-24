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
#import "APMusicInstrumentsCollectionViewDataSource.h"
#import "APAddMusicalInstrumentViewController.h"
#import "APMusicInstrumentsPresentationConstants.h"

@interface APMusicalInstrumentsCollectionViewController ()

@property (nonatomic, strong) IBOutlet APMusicInstrumentsCollectionViewDataSource *allMusicalInstruments;

@end

@implementation APMusicalInstrumentsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
//#warning рекогнайзер стоит создавать в сториборде
}

//#warning тут что-то с форматированием случилось
- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    } else {
        [APMusicalInstrumentsManager deleteInstrument:[self.allMusicalInstruments
                                                       musicalInstrumentWithTypeIndex:indexPath.section
                                                       atIndex:indexPath.row]];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.allMusicalInstruments musicalInstrumentsCountByTypeWithIndex:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    APMusicalInstrumentCollectionCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:APCollectionViewCellIdentifier
                                              forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentWithTypeIndex:indexPath.section atIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.allMusicalInstruments musicalInstrumentTypesCount];
}

@end

