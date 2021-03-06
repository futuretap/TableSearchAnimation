/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The application delegate class used for setting up our data model and state restoration.
 */

#import "APLAppDelegate.h"
#import "APLProduct.h"
#import "APLMainTableViewController.h"
#import "PrivateAnimatedTransition.h"

@implementation APLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // load our data source and hand it over to APLMainTableViewController
    //
    NSArray *products = @[[APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iPhone"
                                                     year:@2007
                                                    price:@599.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iPod"
                                                     year:@2001
                                                    price:@399.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iPod touch"
                                                     year:@2007
                                                    price:@210.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iPad"
                                                     year:@2010
                                                    price:@499.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iPad mini"
                                                     year:@2012
                                                    price:@659.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"iMac"
                                                     year:@1997
                                                    price:@1299.00],
                              [APLProduct productWithType:[APLProduct deviceTypeTitle]
                                                     name:@"Mac Pro"
                                                     year:@2006
                                                    price:@2499.00],
                              [APLProduct productWithType:[APLProduct portableTypeTitle]
                                                     name:@"MacBook Air"
                                                     year:@2008
                                                    price:@1799.00],
                              [APLProduct productWithType:[APLProduct portableTypeTitle]
                                                     name:@"MacBook Pro"
                                                     year:@2006
                                                    price:@1499.00]
                              ];
    
    UINavigationController *navigationController = (UINavigationController *)[self.window rootViewController];
	navigationController.delegate = self;
    // note we want the first view controller (not the visibleViewController) in case
    // we are being store from UIStateRestoration
    //
    APLMainTableViewController *viewController = (APLMainTableViewController *)navigationController.viewControllers[0];
    viewController.products = products;
    
    return YES;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
								  animationControllerForOperation:(UINavigationControllerOperation)operation
											   fromViewController:(UIViewController*)fromVC
												 toViewController:(UIViewController*)toVC {
	return [[PrivateAnimatedTransition alloc] init];
}

#pragma mark - UIStateRestoration

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return YES;
}

@end
