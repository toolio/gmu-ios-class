//
//  SportsManagementAppDelegate.h
//  SportsManagement
//
//  Created by Jason Harwig on 11/2/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportsManagementAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
