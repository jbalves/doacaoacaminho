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
    //[self.lm requestAlwaysAuthorization];
    [self.lm requestWhenInUseAuthorization];
    
    MKCoordinateRegion region = {{0.0 , 0.0} , {0.0 , 0.0}};
    
    //Instituto Alguém
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

// criando as anotações
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *myPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
    myPin.pinColor = MKPinAnnotationColorPurple;
    
    UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [advertButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    myPin.rightCalloutAccessoryView = advertButton;
    myPin.draggable = NO;
    myPin.highlighted = YES;
    myPin.animatesDrop = TRUE;
    myPin.canShowCallout = YES;
    
    return myPin;
    
}

- (void) button: (id) sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DACCarregaInformcaoViewController *ci = [storyboard instantiateViewControllerWithIdentifier:@"st"];
    [self presentViewController:ci animated:YES completion:nil];
        
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if(selected)
    {
        UIView *circularView = [[UIView alloc]initWithFrame:CGRectMake(-55, -55, 110, 110)];
        circularView.tag = 1000;
        
        UIButton *btn1;
        UIButton *btn2;
        UIButton *btn3;
        UIButton *btn4;
        UIButton *btn5;
        UIButton *btn6;
        UIButton *btn7;
        
        btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn1];
        btn1.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(buttonTapped:)];
        tap.numberOfTapsRequired = 1;
        [btn1 addGestureRecognizer:tap];
        
        btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn2];
        
        btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn3];
        
        btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn4];
        
        btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn5];
        
        btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn6];
        
        btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
        [circularView addSubview:btn7];
        
        [btn1 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn3 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn4 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn5 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn6 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        [btn7 setBackgroundImage:[UIImage imageNamed:@"message-icon"] forState:UIControlStateNormal];
        
        CGPoint point = CGPointMake(55, 55);
        btn1.frame = CGRectMake(point.x - 15.00, point.y - 55.00, 30, 30);
        btn2.frame = CGRectMake(point.x + 16.27, point.y - 39.94, 30, 30);
        btn3.frame = CGRectMake(point.x + 24.00, point.y - 06.10, 30, 30);
        btn4.frame = CGRectMake(point.x + 02.36, point.y + 21.04, 30, 30);
        btn5.frame = CGRectMake(point.x - 32.36, point.y + 21.04, 30, 30);
        btn6.frame = CGRectMake(point.x - 54.00, point.y - 06.10, 30, 30);
        btn7.frame = CGRectMake(point.x - 46.27, point.y - 39.94, 30, 30);
        
    }
   // else
    //{
        //[[self viewWithTag:1000] removeFromSuperview];
   // }
}

-(void)buttonTapped:(UITapGestureRecognizer*)sender
{
    NSLog(@"1");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.mysearch resignFirstResponder];
    
    // instanciando geolocalização
    CLGeocoder *gc = [[CLGeocoder alloc] init];
    [gc geocodeAddressString:self.mysearch.text completionHandler:^(NSArray *placemarks, NSError *error)
     {
         // marca localização
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         
         MKCoordinateRegion region;
         CLLocationCoordinate2D newLocation = [placemark.location coordinate];
         region.center = [(CLCircularRegion *) placemark.region center];
         
         MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
         [annotation setCoordinate:newLocation];
         [annotation setTitle:self.mysearch.text];
         [self.map addAnnotation:annotation];
         
         // scroll para a busca
         MKMapRect mr = [self.map visibleMapRect];
         MKMapPoint pt = MKMapPointForCoordinate([annotation coordinate]);
         mr.origin.x = pt.x - mr.size.width * 0.5;
         mr.origin.y = pt.y - mr.size.height * 0.25;
         [self.map setVisibleMapRect:mr animated:YES];
         
         
     }];
    
}

- (IBAction)local:(id)sender
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.map.userLocation.coordinate, 200, 200);
    [self.map setRegion:[self.map regionThatFits:region] animated:YES];
    _local = 1;
}



// mostra a localização atual
- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if (_local == 1)
    {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 200, 200);
        [self.map setRegion:[self.map regionThatFits:region] animated:YES];
        _local = 0;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (IBAction)coordenadas:(id)sender
{
    //Instituto Alguém
    NSString *string1 = @"http://maps.apple.com/maps?daddr=-3.118250, -59.991810";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string1]];
    
    //Casa da Criança
    NSString *string2 = @"http://maps.apple.com/maps?daddr=-3.128212,-60.019614";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string2]];
    
    //GACC
    NSString *string3 = @"http://maps.apple.com/maps?daddr=-3.106615,-60.025107";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string3]];
    
    //Lar Fabiano de Cristo
    NSString *string4 = @"http://maps.apple.com/maps?daddr=-3.052391,-60.048599";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string4]];
    
    //AACH - Casa Vhida
    NSString *string5 = @"http://maps.apple.com/maps?daddr=-3.089008,-60.041589";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string5]];
    
    //Casa Mamãe Margarida
    NSString *string6 = @"http://maps.apple.com/maps?daddr=-3.060130,-59.955029";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string6]];
    
    //Abrigo Moacir Alves
    NSString *string7 = @"http://maps.apple.com/maps?daddr=-3.077436,-60.036255";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string7]];
    
    //Lar Batista Janell Doyle
    NSString *string8 = @"http://maps.apple.com/maps?daddr=-3.120362,-59.938504";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string8]];
    
    //ADEME
    NSString *string9 = @"http://maps.apple.com/maps?daddr=-3.098666, -59.996944";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string9]];
    
    //APAE
    NSString *string10 = @"http://maps.apple.com/maps?daddr=-3.137727,-59.9823294";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string10]];
    
    //Lar das Marias
    NSString *string11 = @"http://maps.apple.com/maps?daddr=-3.085929, -60.036875";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string11]];
    
    //LBV - Legião da Boa Vontade
    NSString *string12 = @"http://maps.apple.com/maps?daddr=-3.127647,-60.007607";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string12]];
    
    //Educandario Gustavo Capanema
    NSString *string13 = @"http://maps.apple.com/maps?daddr=-3.148717,-60.002632";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string13]];








}
@end
