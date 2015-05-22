//
//  DACHistoricoViewController.h
//  DoacaoACaminho
//
//  Created by Rodrigo DAngelo Silva Machado on 5/21/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DACHistoricoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)doar:(id)sender;


@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end
