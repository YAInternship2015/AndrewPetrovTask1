//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APMusicalInstrunemtsViewController.h"
#import "APMusicalInstrumentCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

@interface APMusicalInstrunemtsViewController ()

//#warning Тут конечно дело каждого лично, но мы все пишем (nonatomic, strong) :)
@property (nonatomic, strong) APMusicalInstrumentsManager *allMusicalInstruments;

@end

@implementation APMusicalInstrunemtsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allMusicalInstruments = [APMusicalInstrumentsManager managerWithBasicSetOfInstruments];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allMusicalInstruments musicalInstrumentsCountForType:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    APMusicalInstrumentCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentForType:indexPath.section
                                                                     atIndex:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.allMusicalInstruments musicalInstrumentsTypesCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case APInstrumentsTypeWind:
            return NSLocalizedString(@"Wind_insruments_table_header_title", nil);
            break;
        case APInstrumentsTypeStringed:
            return NSLocalizedString(@"Stringed_insruments_table_header_title", nil);
            break;
        case APInstrumentsTypePercussion:
            return NSLocalizedString(@"Percussion_insruments_table_header_title", nil);
            break;
        case APInstrumentsTypeKeyboard:
            return NSLocalizedString(@"Keyboard_insruments_table_header_title", nil);
            break;
        default:
            break;
    }
    return nil;
}

@end
