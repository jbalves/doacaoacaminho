//
//  DACInstitutionListViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 13/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACInstitutionListViewController.h"

@interface DACInstitutionListViewController () <UITableViewDataSource, UITableViewDelegate> 

@end

@implementation DACInstitutionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark TableView data source and delegate implementation
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [_institutions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstitutionCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[_institutions objectAtIndex:indexPath.row] valueForKey:@"name"];
    
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
