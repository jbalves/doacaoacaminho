//
//  DACLoginViewController.m
//  DoacaoACaminho
//
//  Created by Jeferson Barros Alves on 14/07/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "ICLoginViewController.h"

@interface ICLoginViewController ()

@end

@implementation ICLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if([FBSDKAccessToken currentAccessToken]) {
        [self segueForInitialView];
        return ;
    }
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self segueForInitialView];
    }
    
}

- (void)segueForInitialView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tbController = [storyboard instantiateViewControllerWithIdentifier:@"mainTabBar"];
    [self presentViewController:tbController animated:YES completion:NULL];
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}
@end
