//
//  JsonAppDelegate.h
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JsonViewController;

@interface JsonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

