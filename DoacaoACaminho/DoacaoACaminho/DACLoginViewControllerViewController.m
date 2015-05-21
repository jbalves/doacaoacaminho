//
//  DACLoginViewControllerViewController.m
//  DoacaoACaminho
//
//  Created by Jeferson Barros Alves on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACLoginViewControllerViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>


@interface DACLoginViewControllerViewController ()

@end

@implementation DACLoginViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUpPressed:(id)sender {
    if (self.userNameField.text == nil || [self.userNameField.text isEqualToString:@""]) {
        [self.alertLabel setText:@"Username Required"];
        return;
    }
    if (self.passwordField.text == nil || [self.passwordField.text isEqualToString:@""]) {
        [self.alertLabel setText:@"Password Required"];
        return;
    }
    
    if (self.emailField.text ==nil || [self.emailField.text isEqualToString:@""]) {
        [self.alertLabel setText:@"Email required"];
        return;
    }
    
    PFUser *user = [PFUser user];
    user.username = self.userNameField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    
    // other fields can be set if you want to save more information
   // user[@"phone"] = @"650-555-0000";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)signUpPressed:(id)sender {
//}
@end
