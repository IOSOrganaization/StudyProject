//
//  MovieDetailViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-31.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "MovieDetailViewController.h"


// 预定义[苹果商城上的本程序的资源地址]
#define APP_URL @"http://itunes.apple.com/lookup?id=myapp_id"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

// 关联属性
@synthesize movieTitle;
// 声明关联变量
@synthesize alertView = _alertView;

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
    // Do any additional setup after loading the view from its nib.
    self.title = @"详细信息";
    self.view.backgroundColor= [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 20, 70, 40);
    [button setTitle:@"Click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(100, 180, 100, 50)];
    name.backgroundColor = [UIColor clearColor];
    // 取得传入的参数
    name.text = movieTitle;
    name.textColor = [UIColor blackColor];
    name.textAlignment = UIControlContentVerticalAlignmentBottom;
    [self.view addSubview:name];
    NSLog(@"MovieDetailViewController");
    // 开启本程序网络访问
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // 获取网络苹果商城上的程序信息[Post请求]
    //ASIFormDataRequest *formRequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:APP_URL]];
    //ASIFormDataRequest *formRequest = [ASIFormDataRequest alloc]
    NSString *netVersion = @"0.0";
    // 取得当前程序的版本信息
    NSDictionary *locakDic = [[NSBundle mainBundle] infoDictionary]; // 取得bundle管理器的信息目录
    NSString *localVersion = [locakDic objectForKey:@"CFBundleShortVersionString"]; // 根据Key取得相应的Value值[]版本号
    NSLog(@"appStore版本号为:%@ 本地版本号为:%@", netVersion, localVersion);
    [super viewDidLoad];
    
}
// [UIButton -> button]绑定的按钮点击事件
- (void ) buttonPress:(id) sender{
    // alert:: alloc分配的内存,要手动释放
    _alertView = [[UIAlertView alloc] // 分配空间
                  initWithTitle:@"标题啊" // 固定标题[如果nil为空,则自动隐藏]
                  message:@"这是内容来的拉" // 固定信息
                  delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [_alertView show];
    // 设置样式风格
    [_alertView setAlertViewStyle:UIAlertViewStyleDefault]; // 默认Alert提示样式
    [_alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];// 登陆Alert样式
    // 释放内存
    // [_alertView release];

}
// [UIAlertView -> UIAlertView]
-(void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // AlertView 选择器
    if(alertView == _alertView){
        // 按钮选择器
        if(buttonIndex == alertView.cancelButtonIndex){
            NSLog(@"_alertView Cancel Button Click!");
        }else if(buttonIndex == alertView.firstOtherButtonIndex){
            NSLog(@"_alertView First Button Click!");
        }else if(buttonIndex == alertView.firstOtherButtonIndex+1){
            NSLog(@"_alertView First+1 Button Click!");
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
