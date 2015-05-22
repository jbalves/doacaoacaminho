//
//  DACHistoricoViewController.m
//  DoacaoACaminho
//
//  Created by Rodrigo DAngelo Silva Machado on 5/21/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACHistoricoViewController.h"

@interface DACHistoricoViewController ()

@end

@implementation DACHistoricoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// retorna o número de linhas de cada seção com o banco de dados para a tv
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PFUser *user = [PFUser currentUser];

    PFQuery *donationQuerry = [PFQuery queryWithClassName:@"Donation"];
    [donationQuerry whereKey:@"user" equalTo:[user objectId]];
    
    return [donationQuerry findObjects].count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    PFUser *user = [PFUser currentUser];
    
    PFQuery *donationQuerry = [PFQuery queryWithClassName:@"Donation"];
    [donationQuerry whereKey:@"user" equalTo:[user objectId]];
    
    PFObject *donation = (PFObject *) [[donationQuerry findObjects] objectAtIndex:indexPath.row];
    
    PFQuery *institutionQuerry = [PFQuery queryWithClassName:@"Institution"];
    
    
    return cell;
}

- (IBAction)doar:(id)sender
{
    
}
@end
