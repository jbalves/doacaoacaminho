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
    donations = [[HistoryStore sharedStore] getUserDonationInfo];
    NSLog(@"%ld", donations.count);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [donations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell" forIndexPath:indexPath];
    NSDictionary *donationInfo = (NSDictionary*)[donations objectAtIndex:indexPath.row];
    cell.institution.text = [donationInfo objectForKey:@"institutionName"];
    cell.date.text = [donationInfo objectForKey:@"donationDate"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

@end
