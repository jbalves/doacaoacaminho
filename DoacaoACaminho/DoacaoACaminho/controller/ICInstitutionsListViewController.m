//
//  DACInstitutionListViewController.m
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 13/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ICInstitutionsListViewController.h"
#import "ICInstitutionsMapViewController.h"

@interface ICInstitutionsListViewController () <UITableViewDataSource, UITableViewDelegate> 

@end

@implementation ICInstitutionsListViewController

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:[ICInstitutionsMapViewController class]]) {
        ICInstitutionsListViewController *dest = (ICInstitutionsListViewController*)segue.destinationViewController;
        NSMutableArray *viewControllers = [[self.tabBarController viewControllers] mutableCopy];
        [viewControllers setObject:dest atIndexedSubscript:[self.tabBarController selectedIndex]];
        [self.tabBarController setViewControllers:viewControllers animated:NO];
    }
}


@end
