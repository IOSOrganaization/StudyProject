//
//  XIBUseStartViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "XIBUseStartViewController.h"
@interface XIBUseStartViewController ()
@end
@implementation XIBUseStartViewController
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
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextField:nil];
    [self setResultField:nil];
    [self setUpperCase:nil];
    [self setLowerCase:nil];
    [super viewDidUnload];
}
@end
