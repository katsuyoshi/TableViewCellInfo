//
//  TableViewCellInfoAppDelegate.h
//  TableViewCellInfo
//
//  Created by Katsuyoshi Ito on 09/07/28.
//  Copyright ITO SOFT DESIGN Inc 2009. All rights reserved.
//

#import "RootViewController.h"

@interface TableViewCellInfoAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

