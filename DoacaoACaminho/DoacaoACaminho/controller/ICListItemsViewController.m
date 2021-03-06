//
//  ListaTableViewController.m
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ICListItemsViewController.h"

@interface ICListItemsViewController () {
    NSMutableArray *selectedItems;
}

@end

@implementation ICListItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedItems = [[NSMutableArray alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source and delegate implementation

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    PFQuery *categoryQuery = [PFQuery queryWithClassName:@"Item_Category"];
    return [categoryQuery findObjects].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self ranksCategoryOnSection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ItemStore sharedStore] getItemsOnCategory:[self ranksCategoryOnSection:section]].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSString *cellIdentifier = @"ItemCell";

     ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     
     PFObject *item = (PFObject*) [[[ItemStore sharedStore] getItemsOnCategory:[self ranksCategoryOnSection:indexPath.section]] objectAtIndex:indexPath.row];
     
     cell.name.text =  item[@"name"];
     cell.identifier = [[NSString alloc] initWithFormat:@"%@",item.objectId];
     return cell;
 }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemTableViewCell *cell = (ItemTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    [selectedItems addObject:cell.identifier];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemTableViewCell *cell = (ItemTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [selectedItems removeObject:cell.identifier];
}

#pragma mark - auxiliary mathods

- (NSString*)ranksCategoryOnSection:(NSInteger)section {
    if(section == 0)
        return @"Não Perecível";
    else if(section == 1)
        return @"Perecível";
    else
        return @"Brinquedo";
}

- (NSArray*)selectedItems {
    return [selectedItems copy];
}

#pragma mark - actions

- (IBAction)continueDonation:(UIBarButtonItem *)sender {
//    UITableView *tbView = (UITableView*)[[self view] viewWithTag:2];
//    ItemTableViewCell *cell;
//    for(NSIndexPath *iPath in selected) {
//        cell = (ItemTableViewCell*)[tbView cellForRowAtIndexPath:iPath];
//        [selectedItems addObject:cell.identifier];
//    }
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
