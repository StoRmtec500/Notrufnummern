//
//  InfoViewController.h
//  Notrufnummern
//
//  Created by Martin Kuenz on 15.02.13.
//  Copyright (c) 2013 Martin Kuenz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPal.h"
#import "PayPalAddress.h"
#import "PayPalAdvancedPayment.h"
#import "PayPalAmounts.h"
#import "PayPalInvoiceData.h"
#import "PayPalInvoiceItem.h"
#import "PayPalPayment.h"
#import "PayPalPreapprovalDetails.h"
#import "PayPalReceiverAmounts.h"
#import "PayPalReceiverPaymentDetails.h"
#import <MessageUI/MessageUI.h>

@interface InfoViewController : UIViewController <PayPalPaymentDelegate, MFMailComposeViewControllerDelegate>
- (IBAction)appBewerten:(id)sender;
- (IBAction)appWeiterempfehlen:(id)sender;
- (IBAction)appFeedback:(id)sender;

-(void)payWithPayPal;
@end
