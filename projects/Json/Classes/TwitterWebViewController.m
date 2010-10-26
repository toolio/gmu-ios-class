//
//  TwitterWebViewController.m
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import "TwitterWebViewController.h"

#define STATUS_URL @"http://twitter.com/%@/status/%@"

@implementation TwitterWebViewController
@synthesize webview, tweet;

- (void)loadView {
    self.webview = [[UIWebView alloc] initWithFrame:CGRectZero];    
    self.webview.delegate = self;
    self.webview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;    
    self.view = webview;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString *url = [NSString stringWithFormat:STATUS_URL, [tweet valueForKeyPath:@"user.screen_name"], [tweet objectForKey:@"id"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NETWORK_ON
    [self.webview loadRequest:request];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.webview.delegate = nil;
}

#pragma mark UIWebView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NETWORK_OFF
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NETWORK_OFF
    NSLog(@"Error loading twitter status. Reason: %@", error);
}


- (void) dealloc
{
    [webview release];
    [tweet release];
    [super dealloc];
}


@end
