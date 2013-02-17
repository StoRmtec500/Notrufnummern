//
//  InfoViewController.m
//  Notrufnummern
//
//  Created by Martin Kuenz on 15.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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
    self.navigationController.title = @"Info";
    
    [PayPal initializeWithAppID:@"APP-2LS95895RS6539937"
                 forEnvironment:ENV_LIVE];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    PayPal *p = [PayPal getPayPalInst];
    p.lang = @"de_DE";
    
    UIButton *paypal = [[PayPal getPayPalInst]getPayButtonWithTarget:self andAction:@selector(payWithPayPal) andButtonType:BUTTON_194x37 andButtonText:BUTTON_TEXT_DONATE];
    paypal.frame = CGRectMake(63,230, 194, 37);
    [self.view addSubview:paypal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)paymentCanceled
{
    
}

-(void)paymentFailedWithCorrelationID:(NSString *)correlationID
{
    
}

-(void)paymentLibraryExit
{
    
}

-(void)paymentSuccessWithKey:(NSString *)payKey andStatus:(PayPalPaymentStatus)paymentStatus
{
    
}

- (IBAction)appBewerten:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=337064413"]];
}

- (IBAction)appWeiterempfehlen:(id)sender
{
    NSString *emailTitle = @"Notruf-App weiterempfehlen";
    NSString *messageBody = @"<h1>Notruf-App</h1> schau Dir mal die App an. Ist sehr hilfreich. <br><br>Du kannst die App hier downloaden. LINK";
    NSArray *toEmpfaenger = [NSArray arrayWithObject:@"martin@kuenz.co.at"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setCcRecipients:toEmpfaenger];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail Cancel");
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)appFeedback:(id)sender
{
    NSString *emailTitle = @"Notruf-App Feedback";
    NSString *messageBody = @"<h2>Notruf-App</h2> schreiben Sie uns einfach ein Feedback, für Verbesserungen, Neuerungen, ....";
    NSArray *toEmpfaenger = [NSArray arrayWithObject:@"martin@kuenz.co.at"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toEmpfaenger];
    
    [self presentViewController:mc animated:YES completion:NULL];
}
-(void)payWithPayPal
{
    PayPal *ppMEP = [PayPal getPayPalInst];
    ppMEP.lang = @"de_DE";
    ppMEP.shippingEnabled = NO;
    
    PayPalPayment *payment = [[PayPalPayment alloc]init];
    payment.paymentCurrency = @"EUR";
    payment.paymentType = TYPE_GOODS;
    payment.paymentSubType = SUBTYPE_DONATIONS;
    payment.subTotal = [NSDecimalNumber decimalNumberWithString:@"1.00"];
    payment.recipient =@"martin@kuenz.co.at";
    payment.merchantName =@"Notruf APP";
    
    [ppMEP checkoutWithPayment:payment];
}

@end
