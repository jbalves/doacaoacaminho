//
//  DACDonationDetailViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 13/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACDonationDetailViewController.h"
#import "DonationStore.h"

@interface DACDonationDetailViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *donatedItems;
}

@property (weak, nonatomic) IBOutlet UIImageView *imgInstitution;
@property (weak, nonatomic) IBOutlet UILabel *lblInstitutionName;
@property (weak, nonatomic) IBOutlet UILabel *lblInstitutionAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblInstitutionPhone;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmControlDonationStatus;
@property (weak, nonatomic) IBOutlet UITableView *tbViewItens;

@end

@implementation DACDonationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_donation != NULL) {
        NSLog(@"passou");
    }
    donatedItems = [[NSArray alloc] initWithArray:[[DonationStore sharedStore] getDonationItemsByDonation:_donation]];
    [self setInstitutionInformations];
    // Do any additional setup after loading the view.
}

- (void)setInstitutionInformations {
    _lblInstitutionName.text = [_institution valueForKey:@"name"];
    _lblInstitutionAddress.text = [NSString stringWithFormat:@"%@, %@, %@", [_institution valueForKey:@"street"], [_institution valueForKey:@"number"], [_institution valueForKey:@"postalCode"]];
    [_sgmControlDonationStatus setSelectedSegmentIndex:[[_donation valueForKey:@"delivered"] boolValue] ? 1:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [donatedItems count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Itens Doados";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemDetailCell" forIndexPath:indexPath];
    cell.textLabel.text = (NSString*)[[donatedItems objectAtIndex:indexPath.row] valueForKey:@"name"];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
