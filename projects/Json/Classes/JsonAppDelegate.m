//
//  JsonAppDelegate.m
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import "JsonAppDelegate.h"
#import "JsonViewController.h"

@implementation JsonAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
