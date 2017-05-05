//
//  XMLFileSerializer.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "XMLFileSerializer.h"

@interface XMLFileSerializer(){
    // SAX Delegate 委托需要的临时对象
    NSMutableString *currentElementValue; // 当前Element对象的值Value
    NSMutableString *currentElementName; // 当前Element对象的TAG 标签名称
}
@end
@implementation XMLFileSerializer
-(void) baseMethod{
    // NSXMLParser
    //
    [self SAXDelegateMethod];
}
-(void) xmlMethod{
    // XML 文件组织格式
    // Elements  and tags 元素,标签[不能用在Content 内容上:: >:&gt; <:&lt &:&amp ":&quot ':&apos]
    // Attributes 属性
    // Special characters 特殊字符
    // Comments 评论,注析
    // Processing instructions 处理指令 文件声明指令<?xml version="1.0" encoding="UTF-8" ?>
    
    // Tag,Element 大小写区分
    
    // NSXMLParser 基于SAX[Serial Api XML] xml序列化程序接口,侦听委托方式的序列化[占用内存少,读取一个Element回调]
    // DOM Base 基于Tree-base DOM树的形式手动读取解析方式的序列化[读取整棵数放入内存,转换树]
}
-(void) SAXDelegateMethod{
    NSXMLParser* xmlParser;
    NSData* xmlData;
    // 从当前Bundle程序集搜寻XML文件资源
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* filePath = [bundle pathForResource:@"contacts" ofType:@"xml"]; // 搜寻contacts.xml资源
    xmlData = [NSData dataWithContentsOfFile:filePath];
    //[MyLog info:@"NSData: %@",xmlData];
    xmlParser = [[NSXMLParser alloc] initWithData:xmlData]; // 转换NSData 到转换器
    [xmlParser setDelegate:self];
    [xmlParser parse]; // 执行转换parse序列化
    xmlParser = nil; // 释放对象
    xmlData = nil;
//    [XTMyLog info:@"SAX Base Passer finished!"];
}
#pragma mark -SAX Protocal Method
// 开始读取每个Element 委托的开始读取事件<Tag> 时触发
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                      namespaceURI:(NSString *)namespaceURI
                                     qualifiedName:(NSString *)qName
                                        attributes:(NSDictionary *)attributeDict{
//    [XTMyLog info:@"StartElement:%@",elementName];
    // 标签开始,清空Value
    if(currentElementValue == nil)
        currentElementValue = [[NSMutableString alloc] initWithString:@""];
    else
        [currentElementValue setString:@""];
    // 取得Name
    currentElementName = [NSMutableString stringWithString:elementName];
    
//    if([XTMyLog isEqualToString:@"contact"]){
//        [MyLog info:@"//////读到Contact联系人开始(属性):ID=%@",[attributeDict objectForKey:@"id"]];
//    }
}
// 读取<Tag>Content</Tag> 中的Content时触发,字符触发[迭代字符回调]
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    // Content内容字符串迭代[进制转义...]
    [currentElementValue appendString:string];
}
// 读取完成时触发</Tag> 每个Element的读取完成时
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
//    [MyLog info:@"endElement:%@",elementName];
    if([elementName isEqualToString:@"first_name"]){
//        [MyLog info:@"读到完成first_name标签的Element对象:[%@ = %@]",currentElementName,currentElementValue];
    }else if ([elementName isEqualToString:@"contact"]){
//        [MyLog info:@"读到完成Contact联系人标签的Element对象."];
    }else if ([elementName isEqualToString:@"contacts"]){
//        [MyLog info:@"..END ROOT Element 读到完成所有联系人ROOT标签的contects对象."];
    }else{
//        [MyLog info:@"读到完成其他标签的Element对象:[%@ = %@]",currentElementName,currentElementValue];
    }
}
#pragma matk - DOM Tree Base 
-(void) DOMTreeBaseMethod{
    
}
@end
