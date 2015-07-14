//
//  ViewController.m
//  DoacaoACaminho
//
//  Created by Jeferson Barros Alves on 21/05/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "DACLoginViewController.h"

@interface DACLoginViewController ()

@end

@implementation DACLoginViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
        NSLog(@"Usuário está logado");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DACListaTableViewController *ci = [storyboard instantiateViewControllerWithIdentifier:@"listaTableView"];
        [self presentViewController:ci animated:YES completion:nil];
    }
    
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}
@end
