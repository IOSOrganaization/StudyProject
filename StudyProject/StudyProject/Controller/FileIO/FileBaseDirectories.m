//
//  FileBaseDirectories.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-29.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "FileBaseDirectories.h"

@implementation FileBaseDirectories
-(void) baseMethod{
    // 程序的三个基本目录[Documents,Caches,tmp],Preferences[参数文件目录,不可操作],ITunes文件共享目录
    // Documents
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0]; // 0索引
//    [MyLog info:@"%@",documentsDir];
    // Caches
    paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0]; // 0索引
//    [MyLog info:@"%@",cachesDir];
    // tmp
    NSString *tempDir = NSTemporaryDirectory();
//    [MyLog info:@"%@", tempDir];

    //
    [self nsFileManagerMethod];
    [self propertyListMethod];
    [self settingBundleMethod];
}
// NSFileManager
-(void) nsFileManagerMethod{
    NSFileManager *fileManager = [NSFileManager defaultManager];// 默认文件管理器对象
    BOOL fileExists = [fileManager fileExistsAtPath:[NSTemporaryDirectory() stringByAppendingPathExtension:@"myFile.dat"]];
//    [MyLog infoBool:fileExists];
    NSError *error;
    NSString *fromPath = [NSTemporaryDirectory() stringByAppendingPathExtension:@"old.dat"];
    NSString *toPath = [NSTemporaryDirectory() stringByAppendingPathExtension:@"new.dat"];
    [fileManager copyItemAtPath:fromPath toPath:toPath error:&error]; // 复制文件
}

// SettingPropertyList -- Property List 文件,属性文件参数
-(void) propertyListMethod{
    NSArray *nameList = nil;
    NSPropertyListFormat format; // 枚举类型
    NSString *errorDesc; // 序列化错误描述
    NSString *fileName = @"SettingPropertyList"; // name:文件名,不包含扩展名
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]; // ofType:扩展名类型
//    [MyLog info:@"%@",plistPath]; // Property List 的目录Path
    NSData *plistXml = [[NSFileManager defaultManager] contentsAtPath:plistPath]; // 按类型搜索文件Property:打包组合到同一个文件
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXml mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if(!temp){
//        [MyLog info:@"%s at line %d with message: %@",__FUNCTION__,__LINE__,errorDesc];
    }
    nameList = [temp objectForKey:@"names"]; // 获取属性Property :: names[key]
//    [MyLog info:@"%@",nameList];
}
// Bundler 程序配置参数设置[Application Setting],必须在真机才可以测试设置页面进行程序设置
-(void) settingBundleMethod{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    // 创建Setting Bundle 设置管理器
    // 类型说明:
    // Text Field :: 文件编辑
    // Taggle Switch :: 开关选项
    // Title :: 只读文件属性
    // Slider :: 滑块属性
    // MultiValue : 多值属性
    // Group :: 一组合法的属性
    // Child Pane ::子属性页
    
    NSMutableDictionary *defaultsDict = [[NSMutableDictionary alloc] initWithCapacity:2];
    [defaultsDict setObject:@"XiaoTian" forKey:@"User_name"];
    [defaultsDict setObject:@"21" forKey:@"User_age"];
    
    [userDefault registerDefaults:defaultsDict];
    [userDefault synchronize]; // 同步数据到Bundler设置中
    
    // 取出属性信息
//    [MyLog info:@"Name=%@,Age=%@",[userDefault stringForKey:@"User_name"],[userDefault stringForKey:@"User_age"]];;
}
@end

