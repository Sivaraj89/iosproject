//
//  ParserMethods.m
//  sivarajexercise
//
//  Created by Wipro on 25/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import "ParserMethods.h"

@implementation ParserMethods

-(NSMutableArray *)parserobj:(NSDictionary*)dict
{
    
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    
    NSArray *rows =[dict objectForKey:@"rows"];
    for (int i =0; i<[rows count]; i++)
    {
        CollectedObjects *dictData = [[CollectedObjects alloc]init];
        NSDictionary *dict1 = [rows objectAtIndex:i];
        [dictData setText:[self RemoveNull:[dict1 valueForKey:@"title"]]];
        [dictData setDetailedText:[self RemoveNull:[dict1 valueForKey:@"description"]]];
        [dictData setImage:[self RemoveNull:[dict1 valueForKey:@"imageHref"]]];
        [arrData addObject:dictData];
        
    }
    return arrData;
}
-(NSString*)RemoveNull:(NSString *)nullVal{
    if (nullVal == nil || [nullVal isKindOfClass:[NSNull class]]) {
        nullVal =@"";
    }
    return nullVal;
}


@end
