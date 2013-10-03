//
//  AppDelegate.m
//  Notrufnummern
//
//  Created by Martin Kuenz on 25.12.12.
//  Copyright (c) 2012 Martin Kuenz. All rights reserved.
//

#import "AppDelegate.h"
#import "GAI.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIStoryboard *storyboard;
    if(floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    }else {
        storyboard = [UIStoryboard storyboardWithName:@"Storyboard7" bundle:nil];
    }
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    [self customizeApperance];
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 5;
    // Optional: set debug to YES for extra debugging information.
    [GAI sharedInstance].debug = NO;
    // Create tracker instance.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-38850262-1"];
    // Override point for customization after application launch.
    return YES;
    
}

-(void)customizeApperance
{
   // UIImage *leatherBackground = [UIImage imageNamed:@"main_headline.png"];
   // [[UINavigationBar appearance] setBackgroundImage:leatherBackground forBarMetrics:UIBarMetricsDefault];
}

-(void)roundCorner
{
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
