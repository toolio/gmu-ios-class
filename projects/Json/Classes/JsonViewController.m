//
//  JsonViewController.m
//  Json
//
//  Created by Jason Harwig on 10/25/10.
//  Copyright 2010 Near Infinity Corporation. All rights reserved.
//

#import "JsonViewController.h"
#import <YAJLIOS/YAJLIOS.h>
#import "TwitterWebViewController.h"

#define TWITTER_TIMELINE @"http://api.twitter.com/1/statuses/public_timeline.json"

@implementation JsonViewController
@synthesize results;

- (void)viewDidLoad
{
    NETWORK_ON    
    responseData = [[NSMutableData alloc] init];
    self.results = [NSArray array];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:TWITTER_TIMELINE]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}


#pragma mark NSURLConnection Delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NETWORK_OFF

    self.results = [responseData yajl_JSON];
    NSLog(@"result=%@", self.results);
    [self.tableView reloadData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NETWORK_OFF
    NSLog(@"Response failed. Reason: %@", error);
}


- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"myid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId] autorelease];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
    }
    
    NSDictionary *data = [results objectAtIndex:indexPath.row];
    cell.textLabel.text = [data objectForKey:@"text"];
    cell.detailTextLabel.text = [data valueForKeyPath:@"user.name"];
    
    return cell;
}


#pragma mark TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwitterWebViewController *vc = [[TwitterWebViewController alloc] initWithNibName:nil bundle:nil];
    vc.tweet = [results objectAtIndex:indexPath.row];    
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

@end
