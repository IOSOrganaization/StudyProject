//
//  UseAlertView.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-5.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UseAlertView.h"

@interface UseAlertView ()

@end

@implementation UseAlertView


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
    // 提示框[多种提示框]
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 30, 206, 40);
    button.tintColor = [UIColor redColor];
    [button setTitle:@"点击Alert提示框" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(alertPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button = nil;
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 80, 206, 40);
    button.tintColor = [UIColor redColor];
    [button setTitle:@"点击Sheet提示框" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(sheetPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void) alertPress:(id) sender{
    // [UIButton] Alert按钮点击
    alertView = [[UIAlertView alloc] initWithTitle:@"提示标题" message:@"提示的信息哇!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    // 设置提示框配置
    // Alert类型
    //[alertView setAlertViewStyle:UIAlertViewStyleDefault]; // 默认,提示
    //[alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput]; // 登陆,输入用户名,用户密码的提示Alert
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput]; // 一个输入框,文本输入
    [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput]; // 一个索输入框, 密码输入框
    [alertView show];
}
-(void) sheetPress:(id) sender{
    // [UIButton] ActionSheet:卡片提示
    // 1.iphone时,取消按钮出现,ipad是取消按钮自动隐藏,有点击屏幕空拍地方触发
    // 2.UIActionSheet不能反在 viewDidLoad初始化方法中
    // 3.alet是从屏幕中间弹出,而actonSheet是从屏幕地部推出
    
    seetMessage = [[UIActionSheet alloc] // 分配内存
                   initWithTitle:@"ActionSheet的标题" // 标题
                   delegate:self // 事件委托
                   cancelButtonTitle:@"取消" // 取消按钮
                   destructiveButtonTitle:@"销毁按钮" // 破坏/销毁按钮[可选],样式为红色
                   otherButtonTitles:@"确定", // 其他按钮
                   nil];
    // 显示提示信息[Sheet:卡片]
    [seetMessage showInView:self.view];
}
// [UIAlertView -> UIAlertView 实现方法]
-(void) alertView:(UIAlertView *) _alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // AlertView 选择器
    if(_alertView == alertView){
        // 按钮选择器
        if(buttonIndex == alertView.cancelButtonIndex){
            NSLog(@"_alertView Cancel Button Click!");
        }else if(buttonIndex == alertView.firstOtherButtonIndex){
            NSLog(@"_alertView First Button Click!");
        }else if(buttonIndex == alertView.firstOtherButtonIndex+1){
            NSLog(@"_alertView First+1 Button Click!");
        }
        // 确定输入框的数据值
        UITextField* field1 = [alertView textFieldAtIndex:0];
        NSString *value1 = field1.text;
        NSLog(@"value1: %@", value1);
    }
}

// [UIActionSheet -> actionSheet] 卡片提示方法
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    // actionSheet 按钮事件
    if(buttonIndex == actionSheet.cancelButtonIndex){
        NSLog(@"cancelButtonIndex");
    }else if(buttonIndex == actionSheet.destructiveButtonIndex){
        NSLog(@"destructiveButtonIndex");
    }else if(buttonIndex == actionSheet.firstOtherButtonIndex){
        NSLog(@"firstOtherButtonIndex");
    }else if(buttonIndex == actionSheet.firstOtherButtonIndex+1 ){
        NSLog(@"firstOtherButtonIndex + 1");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
