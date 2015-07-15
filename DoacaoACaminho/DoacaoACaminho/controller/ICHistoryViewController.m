//
//  DACHistoryViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 09/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ICHistoryViewController.h"
#import "DonationStore.h"
#import "HistoryTableViewCell.h"
#import "ICDonationDetailViewController.h"

@interface ICHistoryViewController() <UITableViewDataSource, UITableViewDelegate> {
    NSArray *donations;
}
@property (weak, nonatomic) IBOutlet UITableView *tbViewHistory;

@end

@implementation ICHistoryViewController

- (void)viewDidLoad {
    donations = [[NSArray alloc] init];
    donations = [[DonationStore sharedStore] getUserDonationInfo];
    NSLog(@"%ld", (unsigned long)donations.count);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [donations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell" forIndexPath:indexPath];
    NSDictionary *donationInfo = (NSDictionary*)[donations objectAtIndex:indexPath.row];
    cell.institution.text = [donationInfo objectForKey:@"institutionName"];
    cell.date.text = [donationInfo objectForKey:@"donationDate"];
    cell.donation = [donationInfo objectForKey:@"donationObject"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *iPath = [_tbViewHistory indexPathForSelectedRow];
    if(iPath == NULL)
        return ;
    
    [_tbViewHistory deselectRowAtIndexPath:iPath animated:NO];
    ICDonationDetailViewController *destination = (ICDonationDetailViewController*)segue.destinationViewController;
    destination.donation = (PFObject*)[donations[iPath.row] valueForKey:@"donationObject"];
    destination.institution = [donations[iPath.row] valueForKey:@"institutionObject"];
}

@end
