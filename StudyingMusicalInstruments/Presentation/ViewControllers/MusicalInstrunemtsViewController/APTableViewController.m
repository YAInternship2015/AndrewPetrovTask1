//
//  APTableViewController.m
//  StudyingMusicalInstruments
//
//  Created by Андрей on 8/3/15.
//  Copyright (c) 2015 Андрей. All rights reserved.
//
#import "APTableViewController.h"
#import "APTableViewCell.h"
#import "APMusicalInstrumentsManager.h"
#import "APMusicalInstrument.h"

@interface APTableViewController ()

//#warning Тут конечно дело каждого лично, но мы все пишем (nonatomic, strong) :)
@property (nonatomic, strong) APMusicalInstrumentsManager *allMusicalInstruments;

@end

@implementation APTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"allMusicalInstruments initWithCoder");
#warning чтобы не дублировать инициализацию APMusicalInstrumentsManager, можно вынести ее, скажем, во viewDidLoad. Пока нет вьюхи, тебе этот менеджер все равно не нужен
        self.allMusicalInstruments = [APMusicalInstrumentsManager managerWithBasicSetOfInstruments];
    }
    return self;
}

#warning Обрати внимание, что ты по разному расставляешь открывающуюся фигурну скобку. По гайдам Ялантис она ставится на той же строке, что и имя метода, через пробел
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    if (self) {
        NSLog(@"allMusicalInstruments initWithNibName");
        self.allMusicalInstruments = [APMusicalInstrumentsManager managerWithBasicSetOfInstruments];
    }
    return self;
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        NSLog(@"allMusicalInstruments initWithStyle");
        self.allMusicalInstruments = [APMusicalInstrumentsManager managerWithBasicSetOfInstruments];
    }
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.allMusicalInstruments musicalInstrumentsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    APTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier];
    [cell setInstrument:[self.allMusicalInstruments musicalInstrumentAtIndex:indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
#warning Так как и тебя есть вариант хедера только для одной секции, здесь switch не нужен. Достаточно одного if
    switch (section) {
        case 0:
            return NSLocalizedString(@"Musical_Insruments", nil);
            break;
            
        default:
            break;
    }
    return nil;
}

@end
