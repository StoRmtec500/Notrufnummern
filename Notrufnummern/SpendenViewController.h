//
//  SpendenViewController.h
//  Notrufnummern
//
//  Created by Martin Kuenz on 01.03.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpendenViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *progress;

-(void)startAnimating;
-(void)stopAnimating;

@end
