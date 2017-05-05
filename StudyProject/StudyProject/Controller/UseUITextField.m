//
//  UseUITextField.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-28.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UseUITextField.h"

@interface UseUITextField ()

@end

@implementation UseUITextField
// 声明h/m 文件合成变量 textField
@synthesize textField = textField; //
// 继承
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
    // 创建页面
    // 输入文本框
    textField = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 8.0f, 150.0f, 30.0f)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect]; // 外框
    textField.placeholder = @"请输入密码"; // 提示灰色文本
    textField.secureTextEntry=YES; // 声明为密码输入框
    textField.autocorrectionType=UITextAutocorrectionTypeNo; // 自动修正类型
    textField.autocapitalizationType=UITextAutocapitalizationTypeNone; // 自动转换大写
    textField.returnKeyType=UIReturnKeyDone; // 右下角的return按钮类型[显示为:Done按钮]
    textField.clearButtonMode=  UITextFieldViewModeWhileEditing; // 输入时出现修改X号[全部删除]
    //[UITextFieldViewModeNever,　重不出现
    // UITextFieldViewModeWhileEditing, 编辑时出现
    // UITextFieldViewModeUnlessEditing,　除了编辑外都出现
    // UITextFieldViewModeAlways 　一直出现 ]
    textField.clearsOnBeginEditing = YES; // 编辑前先情空
    textField.textAlignment = UITextAlignmentLeft; // 内容对齐方式
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.adjustsFontSizeToFitWidth = YES; // 自动适应文本大小[文字过多会滚动]
    textField.minimumFontSize = 20;// 最小字体
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone; // 自动转换大小写[首字母大写]
    textField.returnKeyType = UIReturnKeyDone; // return键类型
    /*
     UIReturnKeyDefault, 默认 灰色按钮，标有Return
     UIReturnKeyGo,    　标有Go的蓝色按钮
     UIReturnKeyGoogle,标有Google的蓝色按钮，用语搜索
     UIReturnKeyJoin,标有Join的蓝色按钮
     UIReturnKeyNext,标有Next的蓝色按钮
     UIReturnKeyRoute,标有Route的蓝色按钮
     UIReturnKeySearch,标有Search的蓝色按钮
     UIReturnKeySend,标有Send的蓝色按钮
     UIReturnKeyYahoo,标有Yahoo的蓝色按钮
     UIReturnKeyYahoo,标有Yahoo的蓝色按钮
     UIReturnKeyEmergencyCall, 紧急呼叫按钮
     */
    textField.keyboardAppearance = UIKeyboardAppearanceDefault; // 键盘外
    /*
     UIKeyboardAppearanceDefault， 默认外观，浅灰色
     UIKeyboardAppearanceAlert，　 　深灰 石墨色
     */
    // 委托代理
    textField.delegate = self; // 处理按下return键时处理键盘回收等操作
    // 左右小图片
    UIImage* uiImage = [UIImage imageNamed:@"002"]; // imageNamed: 系统自动加载图片所有资源到缓存[系统有缓存]
    
    UIImageView *leftImage = [[UIImageView alloc] initWithImage:uiImage]; // 创建一个图片对象
    textField.rightView = leftImage; // 设置到组件的左边
//    [leftImage release]; // 释放内存
    textField.rightViewMode= UITextFieldViewModeAlways;// 一直显示小图片
    textField.delegate = self; // 委托到当前[return 事件]
    // 添加组件
    [self.view addSubview:textField];
    // 释放内存
//    [textField release];

    // 用户名
    UILabel* label1=[[UILabel alloc] initWithFrame:CGRectMake(15, 65, 70, 30)]; // 创建实例(x,y,width,height)外矩形
    label1.backgroundColor=[UIColor clearColor]; // 设置背景色
    label1.font=[UIFont fontWithName: @"Helvetica-Bold" size:18]; // 设置字体
    label1.text = @"用户名";
    label1.textColor = [UIColor whiteColor];
    [self.view addSubview:label1];
//    [label1 release];
    // 输入
    UITextField *userField = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 65.0f, 190.0f, 40.0f)];
    [userField setBorderStyle:UITextBorderStyleRoundedRect] ; // 设置外形为圆角矩形
    userField.placeholder=@"请输入用户名";// 提示文本
    userField.secureTextEntry=NO;
    userField.autocorrectionType= UITextAutocorrectionTypeNo; // 取消代输入提示
    userField.autocapitalizationType = UITextAutocapitalizationTypeNone; // 自动大小写
    userField.returnKeyType = UIReturnKeyDone; // 返回按钮类型
    userField.delegate = self; // 委托return事件到当前
    userField.keyboardType = UIKeyboardTypeDefault;// 键盘类型[默认,自动适配当前语言环境]
    userField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;// 文本居中
    
    
    [self.view addSubview:userField];
//    [userField release];

    // 用户密码
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(15, 120, 70, 30)];
    label2.backgroundColor = [UIColor clearColor];
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label2.text=@"密码";
    label2.textColor=[UIColor whiteColor];
    [self.view addSubview:label2];
//    [label2 release];
    // 输入
    UITextField* password = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 120.0f, 190.0f, 40.0f)];
    [password setBorderStyle:UITextBorderStyleRoundedRect];
    password.placeholder=@"请输入密码"; // 灰色提示文本
    password.secureTextEntry=YES; // 安全密码框类型
    password.autocorrectionType=UITextAutocorrectionTypeNo; // 自动提示输入
    password.autocapitalizationType= UITextAutocapitalizationTypeNone; // 自动转换大小写
    password.returnKeyType= UIReturnKeyDone; // 返回键类型
    password.keyboardType=UIKeyboardTypeASCIICapable; // 设置键盘类型
    password.delegate = self; // 委托return事件到当前
    
    [self.view addSubview:password];
//    [password release];

    // 限制输入数字
    UILabel * label3= [[UILabel alloc] initWithFrame:CGRectMake(15.0f, 180.0f, 100.0f, 30.0f)];
    label3.backgroundColor=[UIColor clearColor];
    label3.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    label3.text = @"只输入数字";
    label3.textColor = [UIColor whiteColor];
    [self.view addSubview:label3];
//    [label3 release];
    UITextField *number = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 180.0f, 190.0f, 40.0f)];
    [number setBorderStyle:UITextBorderStyleRoundedRect];
    number.placeholder = @"输入数字";
    number.autocapitalizationType=UITextAutocapitalizationTypeNone; // 自动首字母大写
    number.autocorrectionType=UITextAutocorrectionTypeNo; // 自动改正语法
    number.returnKeyType = UIReturnKeyGo;
    number.delegate = self;
    number.secureTextEntry=NO;
    number.keyboardType = UIKeyboardTypeDefault;

    [self.view addSubview:number];
//    [number release];
}
// UITextField实现方法
// UITextField 组件绑定当前对象的delege 的方法[由签名(方法名,参数名,参数类型),系统自动绑定]
-(BOOL) textFieldShouldReturn:(UITextField *) _textField{
    NSLog(@"textFieldShouldReturn");
    // 关闭输入键盘
    [_textField resignFirstResponder ]; // 放弃第一个返回的结果
    //[_textField becomeFirstResponder ]; // 弹出输入键盘
    
    return YES;
}
// 校验输入的字符串长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 10)
        return NO; // return NO to not change text
    return YES;
}

@end
