//
//  WebServices.m
//  sivarajexercise
//
//  Created by Wipro on 25/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import "WebServices.h"

@implementation WebServices

-(void)webservicerequest:(NSString *)req_Url{
    NSURL *url = [NSURL URLWithString:req_Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Did Receive Response %@", response);
    responseData = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed: %@", [error description]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError *e = nil;
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSISOLatin1StringEncoding];
    NSData *dutf8 = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dutf8 options:NSJSONReadingMutableContainers error:&e];
    [self.webservicedelegate receiveddatadict:dict];
    responseData = nil;
}




@end
