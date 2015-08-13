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
#warning здесь не нужна пустая строка
    return [self.allMusicalInstruments musicalInstrumentsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
#warning здесь не нужна пустая строка    
    APMusicalInstrumentCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier
                                                                    forIndexPath:indexPath];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentAtIndex:indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//#warning Так как и тебя есть вариант хедера только для одной секции, здесь switch не нужен. Достаточно одного if
    return NSLocalizedString(@"musical_insruments_table_header_title", nil);
}

@end
