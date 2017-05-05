//
//  MemoryRetainCount.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "MemoryRetainCount.h"

@implementation MemoryRetainCount
-(id) init{
//    if(self = [super init]){
//        [self retain]; // 引用计算器+1,当引用为0时,对象被销毁
//        [self release]; // 引用计数器-1
////        [MyLog info:@"init the retain count:%d",[self retainCount]]; // 获取引用计数器
//    }
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
//    NSString *selfDes = [self description];
////    [MyLog info:selfDes];
//    //[selfDes release]; // 释放对象内存
//    [selfDes retain];
////    [MyLog info:@"self description:%d",[selfDes retainCount]];
//    [pool release]; // 销毁自动释放池[会向当前池中的所有引用对象发送销毁消息,发送一个release消息到包含的对象]
////    [MyLog info:@"self description:%d",[selfDes retainCount]];
    return self;
    // -fobj-gc-only 源文件编译声明::仅仅支持GC垃圾回收
    // -fobj-gc 源文件同是支持垃圾回收和对象的保留和释放
}
//-(void) dealloc{
////    [MyLog info:@"MemoryRetainCount dealloc"];
//    [super dealloc];
//}
//-(NSString *)description{
//    NSString *des = [[NSString alloc] initWithFormat:@"%@",@"Hello This is description!"];
//    return ([des autorelease]); // 添加自动释放对象池方法[autorelease自动添加到当前活动的自动释放池中]
//}
@end
