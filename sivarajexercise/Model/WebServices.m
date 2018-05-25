//
//  WebServices.m
//  sivarajexercise
//
//  Created by Wipro on 25/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import "WebServices.h"

@implementation WebServices

-(void)webservicerequest:(NSString *)req_Url
{
    NSURL *url = [NSURL URLWithString:req_Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                 completionHandler:^(NSData *data,
                                                                                     NSURLResponse *response,
                                                                                     NSError *error)
                                  {
                                      if (!error)
                                      {
                                          NSError *e = nil;
                                          NSString *iso = [[NSString alloc] initWithData:data encoding:NSISOLatin1StringEncoding];
                                          NSData *dutf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dutf8 options:NSJSONReadingMutableContainers error:&e];
                                          [self.webservicedelegate receiveddatadict:dict];

                                      }
                                      else
                                      {
                                          NSLog(@"Error: %@", error.localizedDescription);
                                      }
                                  }];
        [task resume];

}

@end
