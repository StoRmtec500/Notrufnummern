//
//  SpendenViewController.m
//  Notrufnummern
//
//  Created by Martin Kuenz on 01.03.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "SpendenViewController.h"

@interface SpendenViewController ()

@end


@implementation SpendenViewController

@synthesize progress;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *fullURL = [NSString stringWithFormat:@"http://cms.kuenz.co.at/fileadmin/templates/paypal/paypal_notruf.html"];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_viewWeb.self loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    progress.hidden = FALSE;
    [self.progress startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    progress.hidden = TRUE;
    [self.progress stopAnimating];
}

@end
