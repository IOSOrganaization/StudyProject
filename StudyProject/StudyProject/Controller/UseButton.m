//
//  UseButton.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UseButton.h"

@interface UseButton ()

@end

@implementation UseButton

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
    // 创建Button对象
    // 1.基本方式
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 90, 35)]; // 分配内存
    
    // 2.包含外观方式
    // 2-1.圆角矩形按钮[自动管理内存,不需要收手动释放]
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    // UIButtonTypeCustom = 0, 自定义风格
    // UIButtonTypeRoundedRect, 圆角矩形
    // UIButtonTypeDetailDisclosure, 蓝色小箭头按钮，主要做详细说明用
    // UIButtonTypeInfoLight, 亮色感叹号
    // UIButtonTypeInfoDark, 暗色感叹号
    // UIButtonTypeContactAdd, 十字加号按钮
    // 设置按钮位置
    button.frame = CGRectMake(20, 20, 280, 40);
    // 设置背景色
    button.backgroundColor=[UIColor clearColor];
    
    // 设置文本
    [button setTitle:@"Button" forState:UIControlStateNormal]; // 普通状态,的title文本
    // 设置图片
    [button setImage:[UIImage imageNamed:@"003" ] forState:UIControlStateNormal]; // 普通图片
    // 状态文本,状态图片
    // UIControlStateNormal = 0, 常规状态显现
    // UIControlStateHighlighted = 1 << 0, 高亮状态显现
    // UIControlStateDisabled = 1 << 1, 禁用的状态才会显现
    // UIControlStateSelected = 1 << 2,选中状态
    // UIControlStateApplication = 0x00FF0000, 当应用程序标志时
    // UIControlStateReserved = 0xFF000000 为内部框架预留，可以不管他
    [button setTitle:@"Click" forState:UIControlStateHighlighted]; // 点中时,高亮状态的文本
    // 取消点击时图片颜色加深
    button.adjustsImageWhenDisabled=NO;
    // 点击发光
    button.showsTouchWhenHighlighted = YES;
    // 添加绑定按钮事件::@selector:选择器[buttonClick: 选中buttonClick方法,不能少冒号]
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 取消事件绑定
    [button addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    // 添加按钮到页面view中
    [self.view addSubview:button];
    
//    [button release];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
// 绑定的按钮事件
UIAlertView *alert;
-(void) buttonClick:(id) sender{
    // 强制转换类型
    //UIButton* button = (UIButton *) sender;
    // 对话框
    alert = [[UIAlertView alloc] // 分配内存[手动管理,必须手动释放]
             initWithTitle:@"提示信息" // title 标题
             message:@"这是信息的内容部分" // Message 提示信息
             delegate:self // 委托处理事件对象
             cancelButtonTitle:@"确定" // 第一个按钮文本
             otherButtonTitles:@"取消", // 第二个按钮的文本
             nil // 结束
             ];
   // [alert addButtonWithTitle:@"返回"]; // 添加按钮
    [alert show]; // 显示提示框
//    [alert release]; // 释放内存
    NSLog(@"buttonClick");
}

// 事件[UIAlertView] 处理handle[self绑定处理事件,国定签名]
-(void) alertView:(UIAlertView *) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    // alertView:提示框对象
    // buttonIndex:按钮的位置索引
    if(alertView == alert){
        switch (buttonIndex) {
            case 0:
                NSLog(@"第0个按钮按下事件");
                break;
            case 1:
                NSLog(@"第1个按钮按下事件");
                break;
            case 2:
                NSLog(@"第2个按钮按下事件");
                break;
            default:
                break;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
