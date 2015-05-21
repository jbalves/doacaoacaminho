//
//  DACLoginViewControllerViewController.h
//  DoacaoACaminho
//
//  Created by Jeferson Barros Alves on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DACLoginViewControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

- (IBAction)signUpPressed:(id)sender;

@end
