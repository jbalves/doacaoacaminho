//
//  DACDonationDetailViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 13/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACDonationDetailViewController.h"

@interface DACDonationDetailViewController () <UITableViewDataSource, UITableViewDelegate>

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
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
