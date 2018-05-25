//
//  ViewController.h
//  sivarajexercise
//
//  Created by Wipro on 24/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstView.h"
#import "WebServices.h"
#import "ParserMethods.h"
#import "CollectedObjects.h"
#import  "UIImageView+WebCache.h"

@interface ViewController : UIViewController{
    WebServices *service;
    ParserMethods *parse;
    CollectedObjects *objects;
    NSMutableArray *collectedDatas;
    UIActivityIndicatorView *spinner;
}
@property(nonatomic,strong)FirstView *first;

@end

