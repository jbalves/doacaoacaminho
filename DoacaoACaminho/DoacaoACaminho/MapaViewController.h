//
//  MapaViewController.h
//  DoacaoACaminho
//
//  Created by Rodrigo DAngelo Silva Machado on 5/21/15.
//  Copyright (c) 2015 Jeferson Barros Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@interface MapaViewController : UIViewController <UIApplicationDelegate, MKMapViewDelegate, UISearchBarDelegate, UITabBarControllerDelegate>

// variáveis da tela
@property (weak, nonatomic) IBOutlet MKMapView *map;

@property (strong, nonatomic) CLLocationManager *lm;
@property (weak, nonatomic) IBOutlet UISearchBar *mysearch;
@property (nonatomic) NSInteger local;
@property (nonatomic, readonly) CLLocationCoordinate2D cl;

// métodos dos botões
- (IBAction)coordenadas:(id)sender;




@end
