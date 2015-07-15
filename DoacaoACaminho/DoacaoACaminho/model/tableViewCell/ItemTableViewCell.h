//
//  ItemTableViewCell.h
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 05/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *identifier;
@property (weak, nonatomic) IBOutlet UILabel *name;


@end
