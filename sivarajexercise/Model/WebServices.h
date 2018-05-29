//
//  WebServices.h
//  sivarajexercise
//
//  Created by Wipro on 25/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
///Users/wipro/Desktop/Sivaraj/sivarajexercise/sivarajexercise/Model/Others

#import <Foundation/Foundation.h>

@protocol receivedwebservice <NSObject>

-(void)receiveddatadict:(NSDictionary *)dic;

@end

@interface WebServices : NSObject <NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
    NSMutableData *responseData;
}
-(void)webservicerequest:(NSString *)req_Url;
@property(nonatomic,strong)NSMutableDictionary *dict;
@property(weak,nonatomic) id<receivedwebservice> webservicedelegate;

@end
