//
//  SelectorDelegate.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "SelectorDelegate.h"
@implementation SelectorDelegate
@synthesize myProtocal;
-(id) init{
    self = [SelectorDelegate alloc];
    // 设置协议实现实体
    [self setMyProtocal:self];
    return self;
}
-(void) method{
//    [MyLog info:@"%@",self.myProtocal];
    // 获取协议实体中的属性
    if([self.myProtocal respondsToSelector:@selector(myName:)]){ // 是否实现了某个委托中的方法
//        [MyLog info:@"respondsToSelector."];
//        [MyLog info:[myProtocal myName]]; // 调用委托协议中的方法
    }
}
-(NSString*) myName{
    return @"XiaoTianTian";
}
-(id) copyWithZone:(NSZone *)zone{
    SelectorDelegate * sd;
    sd = [[[self class]allocWithZone:zone]init];//[self class]:获取类对象,allocWithZone分配0地址内存
    
    return sd;
}
@end
