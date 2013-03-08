//
//  ViewController.h
//  Notrufnummern
//
//  Created by Martin Kuenz on 25.12.12.
//  Copyright (c) 2012 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : GAITrackedViewController <CLLocationManagerDelegate>


- (IBAction)buttonPolizei:(id)sender;
- (IBAction)buttonFeuerwehr:(id)sender;
- (IBAction)buttonRettung:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@end
