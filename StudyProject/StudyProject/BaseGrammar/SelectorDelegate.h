//
//  SelectorDelegate.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <Foundation/Foundation.h>
// Selector选择器,Delegate委托
// 声明协议
@protocol MyProtocal <NSObject>
// Protocol协议
-(NSString*) myName;
@end
@interface SelectorDelegate : NSObject<MyProtocal, NSCopying>{
    id<MyProtocal> myProtocal; // 协议::id任意类型的指针<协议名>:遵循协议的指针
}
@property(retain,nonatomic) id<MyProtocal> myProtocal;
-(NSString*) myName;
-(void) method;
@end
