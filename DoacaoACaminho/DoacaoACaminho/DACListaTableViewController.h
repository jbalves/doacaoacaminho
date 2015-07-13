//
//  ListaTableViewController.h
//  DoacaoACaminho
//
//  Created by Robert Pinto de Oliveira on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemTableViewCell.h"
#import "ItemStore.h"

@interface DACListaTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) NSObject *institution;

@end
