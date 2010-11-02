//
//  JsonViewController.h
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonViewController : UITableViewController {
    NSMutableData *responseData;
    NSArray *results;
}

@property (nonatomic, retain) NSArray *results;

@end

