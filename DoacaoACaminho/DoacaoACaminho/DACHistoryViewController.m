//
//  DACHistoryViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACHistoryViewController.h"
#import "HistoryStore.h"
#import "HistoryTableViewCell.h"

@interface DACHistoryViewController() <UITableViewDataSource, UITableViewDelegate> {
    NSArray *donations;
}

@end

@implementation DACHistoryViewController

- (void)viewDidLoad {
    donations = [[NSArray alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    donations = [[HistoryStore sharedStore] getAllUserHistory];
    return donations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell" forIndexPath:indexPath];
    return cell;
}

@end
