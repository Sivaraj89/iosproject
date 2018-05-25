//
//  FirstView.m
//  sivarajexercise
//
//  Created by Wipro on 24/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
@synthesize tableCollection,refressButton;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        tableCollection = [[UITableView alloc]init];
        tableCollection.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:tableCollection];
        
        refressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        refressButton.backgroundColor = [UIColor blackColor];
        [refressButton setTitle:@"Refress" forState:UIControlStateNormal];
        refressButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:refressButton];

    }
    return self;
    
}

@end
