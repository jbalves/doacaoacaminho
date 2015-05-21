//
//  MapaViewController.m
//  DoacaoACaminho
//
//  Created by Rodrigo DAngelo Silva Machado on 5/21/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import "MapaViewController.h"

@interface MapaViewController ()

@end

@implementation MapaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [super viewDidLoad];
    self.mysearch.delegate = self;
    self.map.delegate = self;
    self.lm = [[CLLocationManager alloc] init];
    [self.lm requestAlwaysAuthorization];
    
    MKCoordinateRegion region = {{0.0 , 0.0} , {0.0 , 0.0}};
    
    //Instituto Alguem
    MKPointAnnotation *annotation1 =[[MKPointAnnotation alloc]init];
    annotation1.coordinate = CLLocationCoordinate2DMake(-3.118250, -59.991810);
    annotation1.title = [NSString stringWithFormat:@"Instituto Alguém"];
    [self.map addAnnotation:annotation1];
    
    //Casa da Criança
    MKPointAnnotation *annotation2 =[[MKPointAnnotation alloc]init];
    annotation2.coordinate = CLLocationCoordinate2DMake(-3.128212,-60.019614);
    annotation2.title = [NSString stringWithFormat:@"Casa da Criança"];
    [self.map addAnnotation:annotation2];

    //GACC
    MKPointAnnotation *annotation3 =[[MKPointAnnotation alloc]init];
    annotation3.coordinate = CLLocationCoordinate2DMake(-3.106615,-60.025107);
    annotation3.title = [NSString stringWithFormat:@"Casa da Criança"];
    annotation3.subtitle = [NSString stringWithFormat:@"Grupo de Apoio à Criança com Câncer"];
    [self.map addAnnotation:annotation3];

    //Lar Fabiano de Cristo
    MKPointAnnotation *annotation4 =[[MKPointAnnotation alloc]init];
    annotation4.coordinate = CLLocationCoordinate2DMake(-3.052391,-60.048599);
    annotation4.title = [NSString stringWithFormat:@"Lar Fabiano de Cristo"];
    [self.map addAnnotation:annotation4];

    //AACH - Casa Vhida
    MKPointAnnotation *annotation5 =[[MKPointAnnotation alloc]init];
    annotation5.coordinate = CLLocationCoordinate2DMake(-3.089008,-60.041589);
    annotation5.title = [NSString stringWithFormat:@"AACH - Casa Vhida"];
    [self.map addAnnotation:annotation5];

    //Casa Mamãe Margarida
    MKPointAnnotation *annotation6 =[[MKPointAnnotation alloc]init];
    annotation6.coordinate = CLLocationCoordinate2DMake(-3.060130,-59.955029);
    annotation6.title = [NSString stringWithFormat:@"Casa Mamãe Margarida"];
    [self.map addAnnotation:annotation6];
    
    //Abrigo Moacir Alves
    MKPointAnnotation *annotation7 =[[MKPointAnnotation alloc]init];
    annotation7.coordinate = CLLocationCoordinate2DMake(-3.077436,-60.036255);
    annotation7.title = [NSString stringWithFormat:@"Abrigo Moacir Alves"];
    [self.map addAnnotation:annotation7];

    //Lar Batista Janell Doyle
    MKPointAnnotation *annotation8 =[[MKPointAnnotation alloc]init];
    annotation8.coordinate = CLLocationCoordinate2DMake(-3.120362,-59.938504);
    annotation8.title = [NSString stringWithFormat:@"Lar Batista Janell Doyle"];
    [self.map addAnnotation:annotation8];

    //ADEME
    MKPointAnnotation *annotation9 =[[MKPointAnnotation alloc]init];
    annotation9.coordinate = CLLocationCoordinate2DMake(-3.098666, -59.996944);
    annotation9.title = [NSString stringWithFormat:@"ADEME"];
    annotation9.subtitle = [NSString stringWithFormat:@"Associação Amazonense de Integração de Pais de Deficientes Mentais"];
    [self.map addAnnotation:annotation9];

    //APAE
    MKPointAnnotation *annotation10 =[[MKPointAnnotation alloc]init];
    annotation10.coordinate = CLLocationCoordinate2DMake(-3.137727,-59.9823294);
    annotation10.title = [NSString stringWithFormat:@"APAE"];
    [self.map addAnnotation:annotation10];

    //Lar das Marias
    MKPointAnnotation *annotation11 =[[MKPointAnnotation alloc]init];
    annotation11.coordinate = CLLocationCoordinate2DMake(-3.085929, -60.036875);
    annotation11.title = [NSString stringWithFormat:@"Lar das Marias"];
    annotation11.subtitle = [NSString stringWithFormat:@"Apoio a Mulher com Câncer"];
    [self.map addAnnotation:annotation11];

    //LBV - Legião da Boa Vontade
    MKPointAnnotation *annotation12 =[[MKPointAnnotation alloc]init];
    annotation12.coordinate = CLLocationCoordinate2DMake(-3.127647,-60.007607);
    annotation12.title = [NSString stringWithFormat:@"LBV - Legião da Boa Vontade"];
    [self.map addAnnotation:annotation12];

    //Educandario Gustavo Capanema
    MKPointAnnotation *annotation13 =[[MKPointAnnotation alloc]init];
    annotation13.coordinate = CLLocationCoordinate2DMake(-3.148717,-60.002632);
    annotation13.title = [NSString stringWithFormat:@"Educandario Gustavo Capanema"];
    [self.map addAnnotation:annotation13];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)coordenadas:(id)sender
{
    
}
@end
