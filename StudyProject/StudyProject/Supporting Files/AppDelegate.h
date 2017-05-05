//
//  AppDelegate.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-27.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "Headers.h"

@class ViewController;

// IOS程序必须实现UIApplicationDelegate:接口协议
// 1.程序使用storyboard的时候必须要继承UIResponse
// 2.

@interface AppDelegate : UIResponder <UISplitViewControllerDelegate,UIApplicationDelegate>

// APPDelegate 生成属性 Property
@property (strong, nonatomic) UIWindow * window;/*APP视图窗口*/
@property (strong, nonatomic) ViewController * viewController;/*APP视图控制器*/
// 添加Navigator Control 页面控制器的属性[系统导航控制器]
@property (strong, nonatomic) UINavigationController * navController;

@end