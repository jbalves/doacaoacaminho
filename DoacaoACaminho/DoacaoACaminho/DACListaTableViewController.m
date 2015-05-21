//
//  ListaTableViewController.m
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACListaTableViewController.h"

@interface DACListaTableViewController ()

@property(readonly) NSArray *roupas;
@property(readonly) NSArray *alimentos;

@end

@implementation DACListaTableViewController
{
   // NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _roupas = [NSArray arrayWithObjects:@"Camisa", nil];
     _alimentos = [NSArray arrayWithObjects:@"Arroz", nil];
    NSLog(@"did load..");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 0;
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0) {
        return @"Roupas";
    }else{
        return @"Alimentos";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[ItemStore sharedStore] getAllItens].count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     
 static NSString *simpleTableIdentifier = @"SimpleTableCell";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
 }
     if((cell.accessoryType = UITableViewCellAccessoryNone)){
         cell.accessoryType=UITableViewCellAccessoryCheckmark;
         
     }
     NSString *nome;
    // NSString *code;
     
     if(indexPath.section==0){
         nome=[self.roupas objectAtIndex:indexPath.row];
         //code=[self.statesCodes objectAtIndex:indexPath.row];
     }else if (indexPath.section==1){
         nome=[self.alimentos objectAtIndex:indexPath.row];
         //code=[self.districtCodes objectAtIndex:indexPath.row];
     }

 cell.textLabel.text = nome;
 return cell;
 }

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end