//
//  NSCodingUse.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-22.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "NSCodingUse.h"
// 
@implementation NSCodingUse
@synthesize magicNumber,name,shoeSize,subUses;
-(id)initWithName:(NSString *)name_m magicNumber:(int)magicNumber_m shoeSize:(float)shoeSize_m{
    if(self=[super init]){
        self.name = name_m;
        self.magicNumber = magicNumber_m;
        self.shoeSize = shoeSize_m;
        self.subUses = [NSMutableArray array]; // array:方法创建并返回一个空的数组对象
    }
    return (self);
}
//-(void)dealloc{
//    [name release];
//    [subUses release];
//    [super dealloc];
//}
// NSCoding协议方法
-(void) encodeWithCoder:(NSCoder *)aCoder{
    // 调用编码器[NSCoder]编码对象[数据保存到XML文档]
    [aCoder encodeObject:name forKey:@"name"];// 编码NSString id对象
    [aCoder encodeInt:magicNumber forKey:@"magicNumber"];// 保存的key:value的XML的DOM中
    [aCoder encodeFloat:shoeSize forKey:@"shoeSize"];
    [aCoder encodeObject:subUses forKey:@"subUses"]; // XML保存的key名
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    // 调用编码器[NSCoder]解码对象[从XML文档中解释数据]
    if(self = [super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.subUses = [aDecoder decodeObjectForKey:@"subUses"];
        self.shoeSize = [aDecoder decodeFloatForKey:@"shoeSize"];
        self.magicNumber = [aDecoder decodeIntForKey:@"magicNumber"];
        
    }
    return (self);
}
-(NSString*) description{
    NSString *des = [NSString stringWithFormat:@"name:%@ magic:%d shoeSize:%.1f Sub:%@",name,magicNumber,shoeSize,subUses];
    return (des);
}
@end
