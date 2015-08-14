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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MusicInstruments" ofType:@"plist"];
    NSArray *typesArray = [NSArray arrayWithArray:[NSDictionary dictionaryWithContentsOfFile:plistPath][@"instrument_types"]];
    return NSLocalizedString(typesArray[section], nil);
}

@end
