//
//  ViewController.m
//  Notrufnummern
//
//  Created by Martin Kuenz on 25.12.12.
//  Copyright (c) 2012 Martin Kuenz. All rights reserved.
//

#import "ViewController.h"


//definition für die Telefonnummern
#define feuerwehrNummer @122
#define polizeiNummer @133
#define rettungNummer @144

@interface ViewController ()
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}


@property (nonatomic, retain) IBOutlet UIButton *polizei;
@property (nonatomic, retain) IBOutlet UIButton *feuerwehr;
@property (nonatomic, retain) IBOutlet UIButton *rettung;

@end

@implementation ViewController

@synthesize addressLabel;

- (void)viewDidLoad
{
    self.title =@"Notruf";
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.navigationController.title =@"Notruf";
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *polizei = [UIImage imageNamed:@"btn_polizei.png"];
    [_polizei setBackgroundImage:polizei forState:UIControlStateNormal];
    
    UIImage *feuerwehr = [UIImage imageNamed:@"btn_feuerwehr.png"];
    [_feuerwehr setBackgroundImage:feuerwehr forState:UIControlStateNormal];
    
    UIImage *rettung= [UIImage imageNamed:@"btn_rettung.png"];
    [_rettung setBackgroundImage:rettung forState:UIControlStateNormal];
    
    self.trackedViewName = @"Main View";
    
    locationManager = [[CLLocationManager alloc]init];
    geocoder = [[CLGeocoder alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPolizei:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"POLIZEI NOTRUF" message:@"Polizei 133 wirklich wählen?" delegate:self cancelButtonTitle:@"NEIN" otherButtonTitles:@"JA 133 wählen", nil];
    alert.tag = 1;
    [alert show];
}

- (IBAction)buttonFeuerwehr:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"FEUERWEHR NOTRUF" message:@"Feuerwehr 122 wirklich wählen?" delegate:self cancelButtonTitle:@"NEIN" otherButtonTitles:@"JA 122 wählen", nil];
    alert.tag = 2;
    [alert show];
}

- (IBAction)buttonRettung:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RETTUNG NOTRUF" message:@"Rettung 144 wirklich wählen?" delegate:self cancelButtonTitle:@"NEIN" otherButtonTitles:@"JA 144 wählen", nil];
    alert.tag = 3;
    [alert show];
}

-(void)alertView:(UIAlertView *) action clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSURL *url;
        switch (action.tag) {
                default:
            case 1:
                url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel:%@", polizeiNummer]];
                NSLog(@"wurde gewählt");
                break;
            case 2:
                url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel:%@", feuerwehrNummer]];
                NSLog(@"wurde gewählt");
            break;
            case 3:
                url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel:%@", rettungNummer]];
                break;
        }
        [[UIApplication sharedApplication] openURL:url];
    }
    else
    {
        NSLog(@"abgebrochen");
    }
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@",error);
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Fehler" message:@"Kein GPS Empfang verfügbar!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"didUpdateToLocation: %@", locations);
    CLLocation *currentLocation = [locations lastObject];
        if (currentLocation != nil){
        //    NSLog(@"Location: %.8f", currentLocation.coordinate.longitude);
        }
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks objectAtIndex:0];
            addressLabel.text = [NSString stringWithFormat:@"%@ %@, %@ %@", placemark.postalCode, placemark.locality, placemark.thoroughfare, placemark.subThoroughfare];
           // NSString *locationadress = [[placemark.addressDictionary valueForKey:@"FormatAddressLines"] componentsJoinedByString:@", "];
           // NSLog(@"%@", locationadress);
            
           // addressLabel.text = locationadress;
        }
    }];
        
    }
@end
