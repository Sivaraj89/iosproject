//
//  WebServices.h
//  sivarajexercise
//
//  Created by Wipro on 25/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol receivedwebservice <NSObject>

-(void)receiveddatadict:(NSDictionary *)dic;

@end

@interface WebServices : NSObject

-(void)webservicerequest:(NSString *)req_Url;
@property(nonatomic,strong)NSMutableDictionary *dict;
@property(weak,nonatomic) id<receivedwebservice> webservicedelegate;

@end
