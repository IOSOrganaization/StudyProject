////  CustomTabViewViewController.m//  FirstStydyProject////  Created by XiaoTian on 13-6-9.//  Copyright (c) 2013年 XiaoTian. All rights reserved.//#import "CustomTabViewViewController.h"#import "CustomTabViewContentView.h"#import "CustomTabView.h"@interface CustomTabViewViewController ()@end@implementation CustomTabViewViewController- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];    if (self) {        // Custom initialization    }    return self;}- (void)viewDidLoad{    [super viewDidLoad];    // 创建选项卡内容对象View[内部包含Index和name]    CustomTabViewContentView *content_a = [[CustomTabViewContentView alloc] initWithFrame:self.view.bounds]; // 布满屏幕    [content_a setBackgroundColor:[UIColor purpleColor]];    [content_a setIndex:0];    [content_a setName:@"这是我的选项卡 Tab 1"];        CustomTabViewContentView *content_b = [[CustomTabViewContentView alloc] initWithFrame:self.view.bounds];    [content_b setBackgroundColor:[UIColor blueColor]];    [content_b setIndex:0];    [content_b setName:@"这是Tab 2"];        NSMutableArray * tabViews = [NSMutableArray arrayWithObjects:content_a,content_b, nil];    // 创建选项卡布局[初始化布满屏幕]    CustomTabView * tabView =[[CustomTabView alloc] initWithFrame:self.view.bounds];        [tabView setTabViews:tabViews]; // 设置[初始化View]选中的View    [tabView setActiveBarIndex:0]; // 设置[初始化Bar选项]选中选项卡属性    [tabView setActiveViewIndex:0]; // 设置[初始化选中Content]选中内容视图属性        [self.view addSubview:tabView];}- (void)didReceiveMemoryWarning{    [super didReceiveMemoryWarning];    // Dispose of any resources that can be recreated.}@end