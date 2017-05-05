//
//  UseNavigatorController.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-31.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>
// NavigatorController : 导航控制器,继承UITableViewController父类[页面导航:表格]
@interface UseNavigatorController : UITableViewController // subclass::继承类
// UITableViewController:导航表格
// --- sub view controller 格子
// ---
// ---
// 数据引用声明
@property (strong, nonatomic) NSArray *controllerList;
// 声明全局变量,属性
@property (copy ,nonatomic) NSString * message;
@property (retain, nonatomic) UILabel * detailLabel;

@end
