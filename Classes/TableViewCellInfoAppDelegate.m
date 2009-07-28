//
//  TableViewCellInfoAppDelegate.m
//  TableViewCellInfo
//
//  Created by Katsuyoshi Ito on 09/07/28.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

#import "TableViewCellInfoAppDelegate.h"
#import "RootViewController.h"


@implementation TableViewCellInfoAppDelegate

@synthesize window;
@synthesize tabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:tabBarController.view];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[tabBarController release];
	[window release];
	[super dealloc];
}


@end

