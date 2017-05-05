//
//  DataModleViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "DataModleViewController.h"
#import "DataModelPersistent.h"
#import "XMLFileSerializer.h"

@interface DataModleViewController ()
@end
@implementation DataModleViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[[DataModelPersistent alloc] init] baseMethod]; // SQLLite
    [[[XMLFileSerializer alloc] init] baseMethod];   // XML Paser
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
