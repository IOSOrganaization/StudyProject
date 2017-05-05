//
//  ShareUserDefaults.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-18.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "ShareUserDefaults.h"
// NSUserDefaults
@implementation ShareUserDefaults
-(id) init{
    self = [ShareUserDefaults alloc];
    // NSUserDefaults用户数据共享封装类
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults]; // 用户标准默认配置
    // 保存数据
    [userDefaults setBool:YES forKey:@"key_bool"];
    // 读取数据
    BOOL valueBool = [userDefaults boolForKey:@"key_bool"];
//    [MyLog infoBool:valueBool];

    [userDefaults setDouble:1205.2 forKey:@"key_double"];
//    [MyLog info:@"%f",[userDefaults doubleForKey:@"key_double"]];

    [userDefaults setInteger:NSIntegerMax forKey:@"integer"];
//    [MyLog info:@"%d",[userDefaults integerForKey:@"integer"]];

    [userDefaults setIsAccessibilityElement:YES]; // 可以访问Element元素
    
    [userDefaults setObject:@"Object" forKey:@"obj"];// 设置对象
//    [MyLog info:@"%@",[userDefaults objectForKey:@"obj"]];

    [userDefaults setValue:[[NSArray alloc] init] forKey:@"array"];
    [userDefaults setValuesForKeysWithDictionary:[[NSDictionary alloc] init]];
    return self;
}
// 释放内存
//-(void) dealloc{
//    [super dealloc];
//}
@end
