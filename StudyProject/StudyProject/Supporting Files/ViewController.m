//
//  ViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-27.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "ViewController.h"
#import "UseUITextField.h"

@interface ViewController ()
@end

@implementation ViewController
// UIViewController 类重写方法
- (void)viewDidLoad
{
    // 加载页面
    // Label 标签
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 20.0, 200.0, 50.0)]; // 创建标签
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 80.0, 200.0, 50.0)]; // 创建标签
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 140.0, 200.0, 50.0)]; // 创建标签
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 200.0, 200.0, 50.0)]; // 创建标签
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 260.0, 200.0, 50.0)]; // 创建标签
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 320.0, 200.0, 50.0)]; // 创建标签
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 380.0, 200.0, 50.0)]; // 创建标签
    
    // 设置text属性
    label1.text = @"标签1";
    label2.text = @"标签2";
    label3.text = @"标签3";
    label4.text = @"标签4";
    label5.text = @"标签5";
    label6.text = @"标签6";
    label7.text = @"标签7";
    
    // 设置字体
    label1.font=[UIFont boldSystemFontOfSize:20];
    // 设置颜色
    label1.textColor=[UIColor orangeColor];
    label2.textColor=[UIColor purpleColor];
    // 设置文本对齐
    label1.textAlignment=UITextAlignmentRight;
    label2.textAlignment=UITextAlignmentCenter;
    // 自动适应宽度
    label3.adjustsFontSizeToFitWidth = YES;
    // 设置行数
    label5.numberOfLines = 2;
    // 去掉背景色
    label5.backgroundColor=[UIColor clearColor];
    // 设置高亮
    label6.highlighted=YES;
    label6.highlightedTextColor=[UIColor orangeColor];
    // 设置阴影
    label7.shadowColor=[UIColor redColor];
    label7.shadowOffset=CGSizeMake(1.0, 1.0);
    // 设置是否可以交换
    label7.userInteractionEnabled = YES;
    // 设置文字是否可变[默认YES]
    label7.enabled=NO;
    // 设置文字超长时显示格式
    label7.lineBreakMode = UILineBreakModeMiddleTruncation; // 截去中间的部分[多余部分,头,中间,尾]
    // 设置自动适应宽度的基线
    label3.baselineAdjustment = UIBaselineAdjustmentNone;
    // 添加组件到view容器中
    [self.view addSubview:label1]; // 调用view的方法: 参数(单个)
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:label6];
    [self.view addSubview:label7];
    
    // 释放内存
//    [label1 release];
//    [label2 release];
//    [label3 release];
//    [label4 release];
//    [label5 release];
//    [label6 release];
//    [label7 release];
    [super viewDidLoad];
    
    // 跳转页面
    // 1 压入.推出方式
    // 创建页面对象Control
    UseUITextField*  textFieldView=[[UseUITextField alloc] init];
    [self.navigationController pushViewController:textFieldView animated:(YES)]; // 压入页面
    //[self.navigationController popToRootViewControllerAnimated:true]; // 推出页面
    // 2 UIViewController:类的跳转方法
    [self presentModalViewController:textFieldView animated:YES]; // 加载页面
    // [self dismissModalViewControllerAnimated:YES];// 销毁页面
//    [textFieldView release];
//    [self release];
    NSLog(@"End View");
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)dealloc {
//    [super dealloc];
//}
- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
