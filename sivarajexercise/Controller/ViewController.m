//
//  ViewController.m
//  sivarajexercise
//
//  Created by Wipro on 24/05/18.
//  Copyright © 2018 Wipro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,receivedwebservice>

@end

@implementation ViewController
@synthesize first;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title =@"";
    service = [[WebServices alloc]init];
    service.webservicedelegate = self;
    [self WebCallInitiated:@"InitialCall"];
    }

-(void)addConstranits{
    NSLayoutConstraint * x = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint * y = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint * width = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint * height = [NSLayoutConstraint constraintWithItem:first attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [self.view addConstraint:x];
    [self.view addConstraint:y];
    [self.view addConstraint:width];
    [self.view addConstraint:height];
    
   NSLayoutConstraint * x1 = [NSLayoutConstraint constraintWithItem:first.refressButton attribute:NSLayoutAttributeLeadingMargin relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeLeadingMargin multiplier:1.0 constant:0];
    NSLayoutConstraint * y1 = [NSLayoutConstraint constraintWithItem:first.refressButton attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:first.tableCollection attribute:NSLayoutAttributeBottomMargin  multiplier:1.0 constant:10];
    NSLayoutConstraint * width1= [NSLayoutConstraint constraintWithItem:first.refressButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint * height1 = [NSLayoutConstraint constraintWithItem:first.refressButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0];
    [first addConstraint:x1];
    [first addConstraint:y1];
    [first addConstraint:width1];
    [first addConstraint:height1];
    
    NSLayoutConstraint * x2 = [NSLayoutConstraint constraintWithItem:first.tableCollection attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint * y2 = [NSLayoutConstraint constraintWithItem:first.tableCollection attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint * width2 = [NSLayoutConstraint constraintWithItem:first.tableCollection attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint * height2 = [NSLayoutConstraint constraintWithItem:first.tableCollection attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:first attribute:NSLayoutAttributeHeight multiplier:0.95 constant:0];
    [first addConstraint:x2];
    [first addConstraint:y2];
    [first addConstraint:width2];
    [first addConstraint:height2];
    
}



-(BOOL)shouldAutorotate
{
    return YES;
}

-(void)receiveddatadict:(NSDictionary *)dic
{
    self.title = [dic objectForKey:@"title"];
    parse =[[ParserMethods alloc]init];
    collectedDatas = [[NSMutableArray alloc]init];
    collectedDatas = [parse parserobj:dic];
    first = [[FirstView alloc]init];
    first.translatesAutoresizingMaskIntoConstraints = NO;
    first.tableCollection.delegate = self;
    first.tableCollection.dataSource = self;
    [first.refressButton addTarget:self action:@selector(WebCallInitiated:) forControlEvents:UIControlEventTouchDown];
    [spinner stopAnimating];
    [self.view addSubview:first];
    [self addConstranits];
}


// tableView Delegates and Datasource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseCell"];
    }
    objects = (CollectedObjects *)[collectedDatas objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.textLabel.text =objects.text;
    cell.textLabel.numberOfLines =0;
    cell.detailTextLabel.text =objects.detailedText;
    cell.detailTextLabel.numberOfLines = 0;
    NSString* urlTextEscaped = [objects.image stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlTextEscaped] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return collectedDatas.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}


-(void)WebCallInitiated:(NSString *)action
{
    NSLog(@"%@",action);
  [service webservicerequest:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"];
    spinner = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint * x2 = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint * y2 = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint * width1= [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    NSLayoutConstraint * height1 = [NSLayoutConstraint constraintWithItem:spinner attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.5 constant:0];

    [self.view addSubview:spinner];
    [self.view addConstraint:x2];
    [self.view addConstraint:y2];
    [self.view addConstraint:width1];
    [self.view addConstraint:height1];
    [spinner startAnimating];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end




