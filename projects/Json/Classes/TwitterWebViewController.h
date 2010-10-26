//
//  TwitterWebViewController.h
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TwitterWebViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webview;
    NSDictionary *tweet;
}
@property (nonatomic, retain) UIWebView *webview;
@property (nonatomic, retain) NSDictionary *tweet;
@end
