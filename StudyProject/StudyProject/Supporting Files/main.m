//
//  main.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-27.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// 程序主入口
int main(int argc, char *argv[]){
    // autoreleasepool 自动释放内存池
    @autoreleasepool {
        // 启动主页面
        // UI页面线程入口
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        // UIApplicationMain 执行的流程:
        // 1.创建上下文共享的唯一程序上下文 UIApplication.sharedApplication() 实例
        // 2.创建程序的委托执行类AppDelegate,委托APP的生命周期到该类
        // 3.如果程序编译后的Info.plist中配置了程序主页面的storyboard,那么程序会加载该页面并从storyboard入口开始初始化
        // 4.UIApplicationMain开始他的生命后期事件委托调用,首先调用application:didFinishLaunchingWithOptions:方法
        // 5.如果是通过storyboard的方法加载页面,那么系统自动调用UIWindow的显式页面方法makeKeyAndVisible,如果是通过代码方法加载主页面,那么要由用户手动调用UIWindow的显式加载方法
        // 6.UIWindow开始显式,所有被初始化的UIWindow将按秩序创建UI,UIView的生命周期开始. 开始调用viewDidLoad方法
        
        // 快捷建:
        // 注解选中行: CMD+/
        // 取消注解选中行: CMD+/
        // 代码提示: ctrl+.
        // 编译运行: CMD+R
        // 编译调试: CMD+Y
        // 编译 : CMD+B
        // 清理 : CMD+Shift+K
        // 代码提示: Esc
        // 接受代码提示: Tab
        // 删除本行 : Ctrl+K
    }
}
