//
//  DACDonationDetailViewController.h
//  DoacaoACaminho
//
//  Created by Patrick Magalhães de Lima on 13/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ICDonationDetailViewController : UIViewController

@property (nonatomic, strong) PFObject *donation;
@property (nonatomic, strong) NSObject *institution;

@end
