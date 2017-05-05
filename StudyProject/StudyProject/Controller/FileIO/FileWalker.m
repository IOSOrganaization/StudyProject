//
//  FileWalker.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "FileWalker.h"
#import "NSCodingUse.h"
#import "NSCopingUse.h"
#import "KeyValueObject.h"

// 文件遍历操作对象
@implementation FileWalker
-(void) enumeratorFiles{
    //NSAutoreleasePool *pool =[[NSAutoreleasePool alloc] init];
    
    NSFileManager * fileManger =[NSFileManager defaultManager];// 取得当前默认的文件管理器对象[单例对象]
    // stringByExpandingTildeInPath:波浪线扩展的Path路径[系统自动解析] ~/Documents:Documents目录...
    NSString *home = [@"~" stringByExpandingTildeInPath];// ~:用户主目录[/Users/markd/](代字符)
    NSDirectoryEnumerator *directoryEnum = [fileManger enumeratorAtPath:home];
    
    NSMutableArray *files = [NSMutableArray arrayWithCapacity:42];// 创建可变数组
    NSString *fileName;
    while(fileName = [directoryEnum nextObject]){ // NSDirectoryEnumerator:迭代完成返回nil:0x00地址
        if([[fileName pathExtension] isEqualToString:@"png"]){ // pathExtension:路径扩展名[最后.]
            [files addObject:fileName];
        }
    }
    NSEnumerator *fileEnum = [files objectEnumerator]; // 迭代器
    while(fileName = [fileEnum nextObject]){
//        [MyLog info:@"%@",fileName];
    }
    // 迭代对象,并和for解迭代
    for(NSString *name in [fileManger enumeratorAtPath:home]){
        if([[name pathExtension] isEqualToString:@"png"]){ // pathExtension:路径扩展名[最后.]
//            [MyLog info:@"for->%@",name];
        }
    }
    [self nsStringMethod];
    [self nsArrayMethod];
    [self nsNumberMethod];
    [self nsValueMethod];
    [self nsDateMethod];
    [self nsDataMethod];
    [self nsCollectionMethod];
    [self nsCodingMethod];
    [self keyValueCodingMethod];
    [self nsPredicateMethod];
    //[pool drain]; //释放内存,并弹出栈中的对象
}
// 字符串NSString
-(void) nsStringMethod{
    NSString * compareString = @"CompareString";
//    [MyLog infoBool:[compareString isEqualToString:@"compareString"]]; // 字符串比较
    NSComparisonResult result = [compareString compare:@"CompareString"]; // compare:默认比较器
//    [MyLog info:@"%d",result]; // 逐字比较,返回NSComparisonResult枚举
    //NSCaseInsensitiveSearch忽略大小写,NSLiteralSearch匹配大小写,NSNumericSearch字符个数
    NSStringCompareOptions options = NSCaseInsensitiveSearch|NSNumericSearch; // compare条件
    result =[compareString compare:@"comparestring" options:options];
//    [MyLog info:@"%d",result]; // 逐字比较,返回NSComparisonResult枚举
//    [MyLog infoBool:[compareString hasPrefix:@"Com"]]; // 包含前缀
//    [MyLog infoBool:[compareString hasSuffix:@"String"]]; // 包含后缀
    NSRange range = [compareString rangeOfString:@"pare"]; // 包含的位置[NSRange:location,length]
    if(range.location != NSNotFound){ // 包含
//        [MyLog info:@"%d,%d",range.location,range.length]; // [开始位置,长度]
    }
    // 切分数组[NSString]
    NSString *pattern = @"小明:24,小功:190,安安:89,李希:20";
    NSArray *persons = [pattern componentsSeparatedByString:@","]; // 切分
//    [MyLog info:@"%@",persons];
    // 组合为字符串[NSArray]
    pattern = [persons componentsJoinedByString:@"/"];
//    [MyLog info:pattern];
}
// 数组
-(void) nsArrayMethod{
    NSArray *array = [[NSArray alloc] initWithObjects:@"小明",@"小工",@"小樱", nil];
    NSEnumerator *enumerator = [array objectEnumerator];// 取得数组枚举器
    id obj;
    while(obj = [enumerator nextObject]){
//        [MyLog info:@"%@",obj];
    }
    // NSDictionary...
}
// 数字封装类
-(void) nsNumberMethod{
    NSNumber *number;
    number = [NSNumber numberWithBool:YES];
    number = [NSNumber numberWithDouble:52.0f];
    number = [NSNumber numberWithInt:56];
    number = [NSNumber numberWithLong:1203656L];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithCapacity:10];
    [dictionary setObject:number forKey:@"number"]; // 封装为对象NSObject
//    [MyLog info:@"%lld",[number longLongValue]]; // d/i:整数,lld,llu长整,x二进制,o八进制,Lf64位双字
}
// 封装任何数据/对象
-(void) nsValueMethod{
    NSValue *value ;
    // 封装Struct结构
    NSRange range = NSMakeRange(10, 5);
    value = [NSValue valueWithBytes:&range objCType:@encode(NSRange)]; // &取地址,@encode:编码类型方式
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:10];
    [array addObject:value];
    value = [array objectAtIndex:0];
    [value getValue:&range]; // 取出bytes到指定地址
//    [MyLog info:@"%d,%d",range.location,range.length];
    // 常见的struct封装NSValue[系统封装好的对象]
    value = [NSValue valueWithRange:range]; // NSRange->NSValue
    range = [value rangeValue]; //NSValue->NSRange
//    [MyLog info:@"%d,%d",range.location,range.length];
    // NSNull:空值Object对象,nil地址0x000
    [array addObject:[NSNull null]];
//    [MyLog infoBool:[array lastObject] == [NSNull null]];
}
// NSDate 日期函数
-(void) nsDateMethod{
    NSDate *date = [NSDate date]; // 获取当前日期时间::国际标准时间[需要转换为中国时间]
//    [MyLog info:@"现在时间是:%@",date];
//    [MyLog info:@"%@",[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]];// 根据与当前时间差创建日期时间对象[单位秒]
}
// NSData 数据对象
-(void) nsDataMethod{
    const char *string = "Hi there, this is a c String."; // C 语言的字符串   
    NSData *data = [NSData dataWithBytes:string length:strlen(string)+1]; // 转换到NSData对象[字节数据]
//    [MyLog info:@"%@",data];
//    [MyLog info:@"%d byte string is ::%s",[data length],[data bytes]]; // 输出C字符串%s
}
// NSArray,NSDictionary 集合
-(void) nsCollectionMethod{
    NSArray *array = [NSArray arrayWithObjects:@"I",@"Seem",@"To",@"Be",@"A",@"Verb", nil];// NSArray对象
    // 保存[自动序列化,注意:有任何异常系统没提示(文件目录不存在,没权限等...)]
    [array writeToFile:@"/tmp/verbiage.txt" atomically:YES]; //写入集合到文件[文件名 是否缓冲保存防止文件破坏]
    // 读取[自动反序列化]
    NSArray *array_2 = [NSArray arrayWithContentsOfFile:@"/tmp/verbiage.txt"];
//    [MyLog info:@"%@",array_2];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"chevy",@"make", // Value,Key
                                @"nova",@"model",
                                [NSNumber numberWithInt:1986],@"modelYear", // Value,Key
                                nil];
//    [MyLog info:@"%@",dictionary];

}
// NSCoding 编码对象协议NSCodingUse
-(void) nsCodingMethod{
    NSCodingUse *coding = [[NSCodingUse alloc]initWithName:@"XiaoTian" magicNumber:12 shoeSize:56.5];
    [coding.subUses addObject:[[NSCodingUse alloc] initWithName:@"Sub_XiaoTian" magicNumber:10 shoeSize:52.0]];
    
//    [MyLog info:@"NSCoding 前:%@",coding];
    // 通过NSCoding协议编码方式保存对象到XML文档[对象转换为XML文档的NSData数据]
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:coding]; // NSKeyedArchiver:关键字存续器,Root对象存续
    // NSData 写入文件
    [data writeToFile:@"/tmp/coding.xml" atomically:YES];
    // NSData 读取文件[读取文件数据到NSData对象数组]
    NSData *data_2 = [[NSData alloc] initWithContentsOfFile:@"/tmp/coding.xml"];
    // 解码
//    [MyLog info:@"NSCoding 后 NSData:%@",[NSKeyedUnarchiver unarchiveObjectWithData:data_2]]; // NSData 解码
//    [MyLog info:@"NSCoding 后 File:%@",[NSKeyedUnarchiver unarchiveObjectWithFile:@"/tmp/coding.xml"]]; // File 解码

    // NSDictionary
    NSCopingUse *copy = [[NSCopingUse alloc]initWithName:@"TianTian"];
//    [MyLog info:[copy valueForKey:@"name"]];
}
// Key Value Coding 对象操作语法[键值编码语法]
-(void) keyValueCodingMethod{
    // 创建对象实例
    KeyValueObject *user = [[KeyValueObject alloc] initWithName:@"XiaoTian" age:23 weight:58.3];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"广东省" city:@"广州市" area:@"海珠区"street:@"赤岗 赤岗街道一街" houseNumber:152 longitude:52.3630 latitude:112.365]];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"河北省" city:@"北京市" area:@"海锭区"street:@"黄文一街" houseNumber:12 longitude:112.3630 latitude:182.365]];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"广东省" city:@"广州市" area:@"天河区"street:@"天河街道四街" houseNumber:102 longitude:59.3630 latitude:113.365]];
    [user setCurrentAddress:[user.addresses objectAtIndex:0]];
    // K-V 查询变量值[selector机制]
    // valueForKey:1.查找关联的getter方法,2.查找实例同名变量,3.查找加下划线的同名变量[_是苹果编译器的默认所有实例变量的开头]
    NSString *name = [user valueForKey:@"name"]; // 返回指定property属性的值[getter方法]
//    [MyLog info:@"Name:%@",name];
//    [MyLog info:@"Name:%@",[user valueForKey:@"firstName"]]; // 返回实例变量 [firstName]
//    [MyLog info:@"Nick Name:%@",[user valueForKey:@"nickName"]]; // 返回实例变量 [_nickName]

    // K-V 修改变量值[1.查找关联的setter方法,2.查找实例同名变量,3.查找加下划线的同名变量]
    [user setValue:@"小甜甜" forKey:@"name"]; // 设置id对象到Key
    [user setValue:[NSNumber numberWithInt:25] forKey:@"age"]; // 设置基本类型到Key[把基本类型用NSNumber封装]
//    [MyLog info:@"New Name:%@,New Age:%@",[user valueForKey:@"name"],[user valueForKey:@"age"]];//valueForKey:id对象

    // K-V Path指定Key的Selector方法路径选择法[这种方式迭代效率不高,但是简单]
//    [MyLog info:@"Address:%@",[user valueForKeyPath:@"currentAddress.country"]]; // 属性中的属性[Key-Value模式]
    // 选出到NSArray对象
    NSArray * streets = [user valueForKeyPath:@"addresses.street"];
//    [MyLog info:@"Streets:%@",streets];

    // Key-Value 运算符[效率不高,系统迭代计算...],无Key系统崩溃
//    [MyLog info:@"地址总是(调用返回对象的方法):%@",[user valueForKeyPath:@"addresses.@count"]]; // valueForKeyPath:NSNumber对象封装
//    [MyLog info:@"平均经度(avg):%@",[user valueForKeyPath:@"addresses.@avg.longitude"]]; //数学函数[必须小写]:@运算.变量
//    [MyLog info:@"门牌号和(sum):%@",[user valueForKeyPath:@"addresses.@sum.houseNumber"]];
//    [MyLog info:@"门牌号最大(max):%@",[user valueForKeyPath:@"addresses.@max.houseNumber"]];
//    [MyLog info:@"门牌号最小(min):%@",[user valueForKeyPath:@"addresses.@min.houseNumber"]];
//    [MyLog info:@"国家排除重复值(distinctUnionOfObjects):%@",[user valueForKeyPath:@"addresses.@distinctUnionOfObjects.country"]];

    // Dictionary模式设置值
    NSDictionary *collectionValue = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     @"小天",@"name", // Value,Key[对应对象中的属性名,Property属性]
                                     [NSNumber numberWithInt:18],@"age",
                                     [NSNull null],@"addresses", // 设置为对象空值[清空]
                                     nil];
    [user setValuesForKeysWithDictionary:collectionValue];
//    [MyLog info:@"%@",user];

    [user setNilValueForKey:@"currentAddress"]; // 直接调用setNil方法给变量付空值[重写setNil..方法]
//    [MyLog info:@"%@",user];

    // 设置未定义的键Key[重写UndefinedKey的setter,getter方法]
    // 重写两个方法后不会报this class is not key value coding-compliant for the key xxx的错误
    [user setValue:@"我是共产党员!" forKey:@"myLegend"]; // 设置未定义Key
//    [MyLog info:@"%@",[user valueForKey:@"myLegend"]]; // 获取未定义Key的值

    [user setValue:[NSNull null] forKey:@"myLegend"]; // 设置为对象的空值[<null>对象]
//    [MyLog info:@"%@",[user valueForKey:@"myLegend"]]; // 获取未定义Key的值

    [user setValue:nil forKey:@"myLegend"]; // 设置为0[nil],地址0x000清空对象(null) 不存在空值
//    [MyLog info:@"%@",[user valueForKey:@"myLegend"]]; // 获取未定义Key的值
}
// NSPredicate 谓语[对象属性过滤器]对象
-(void) nsPredicateMethod{
    KeyValueObject *user = [[KeyValueObject alloc] initWithName:@"XiaoTian" age:23 weight:58.3];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"广东省" city:@"广州市" area:@"海珠区"street:@"赤岗 赤岗街道一街" houseNumber:152 longitude:52.3630 latitude:112.365]];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"河北省" city:@"北京市" area:@"海锭区"street:@"黄文一街" houseNumber:12 longitude:112.3630 latitude:182.365]];
    [user.addresses addObject:[[Address alloc]initWithCountry:@"中国" province:@"广东省" city:@"广州市" area:@"天河区"street:@"天河街道四街" houseNumber:102 longitude:59.3630 latitude:113.365]];
    [user setCurrentAddress:[user.addresses objectAtIndex:0]];
    // 格式初始化过滤器NSPredicate[谓语], :class path = value
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=='XiaoTian'"];// 创建过滤器:class path = value
    BOOL isxiaotian = [predicate evaluateWithObject:user];
//    [MyLog infoBool:isxiaotian key:@"Name Is XiaoTian"];
    // 条件过滤器
    predicate = [NSPredicate predicateWithFormat:@"age > 18"]; // class path > value
//    [MyLog infoBool:[predicate evaluateWithObject:user] key:@"Age > 18"];
    // formate格式化匹配路径串
    predicate = [NSPredicate predicateWithFormat:@"age > %d", 24]; // 支持String的formate格式化[%K代表Class Path]
//    [MyLog infoBool:[predicate evaluateWithObject:user] key:@"Age > 24"];
    // %K
    predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", @"XiaoTian"]; // %K:K必须大写
//    [MyLog infoBool:(BOOL)[predicate evaluateWithObject:user] key:@"Name Is XiaoTian %K"];
    // $ variable name
    NSPredicate *predicateTemp = [NSPredicate predicateWithFormat:@"name == $name"]; // 变量name
    NSDictionary *predicateKeyValue = [NSDictionary dictionaryWithObjectsAndKeys:@"XiaoTian",@"name", nil];
    predicate =[predicateTemp predicateWithSubstitutionVariables:predicateKeyValue]; // 设置参数->变量值[key==>name]
//    [MyLog infoBool:(BOOL)[predicate evaluateWithObject:user] key:@"Name Is XiaoTian $name"];

    
    // NSArray,NSMutableArray 中调用过滤器
    NSMutableArray *array = user.addresses;
    predicate = [NSPredicate predicateWithFormat:@"houseNumber > 100"]; // 门牌大于120
    NSArray *filterArray = [array filteredArrayUsingPredicate:predicate]; // 集合过滤器过滤对象[返回定集合数组]
//    [MyLog info:@"NSArray Filter:%@",filterArray];

    // >,>=,<,<=,!=,<>,AND,OR,NOT,&&,||,! [连接条件不区分大小写]
    predicate = [NSPredicate predicateWithFormat:@"houseNumber >100 AND houseNumber <150"];
    filterArray = [array filteredArrayUsingPredicate:predicate];
//    [MyLog info:@"houseNumber>100 AND housenumber<150:%@",filterArray];
    // BETWEEN 介于
    predicate = [NSPredicate predicateWithFormat:@"houseNumber BETWEEN {100,200}"];
//    filterArray = [array filteredArrayUsingPredicate:predicate];
//    [MyLog info:@"houseNumber BETWEEN {100,150}:%@",filterArray];
    // 变量模式
    NSArray *between = [NSArray arrayWithObjects:[NSNumber numberWithInt:100],[NSNumber numberWithInt:150], nil];
    predicateTemp = [NSPredicate predicateWithFormat:@"houseNumber BETWEEN %@",between];
    NSDictionary *between_d = [NSDictionary dictionaryWithObjectsAndKeys:between,@"between", nil];
    predicate = [predicateTemp predicateWithSubstitutionVariables:between_d];
    filterArray = [array filteredArrayUsingPredicate:predicate];
//    [MyLog info:@"houseNumber BETWEEN {100,150}:%@",filterArray];

    // SELF引用,自身引用
    predicate = [NSPredicate predicateWithFormat:@"SELF.name IN {'XiaoFang','XiaoMing','XiaoHong','XiaoTian'}"];
//    [MyLog infoBool:[predicate evaluateWithObject:user] key:@"SELF.neme IN {...}"];

    NSArray *name1 = [NSArray arrayWithObjects:@"小明",@"小樱",@"小溪",@"小玲",@"小天", nil];
    NSArray *name2 = [NSArray arrayWithObjects:@"小天",@"小玲", nil];
    predicate =[NSPredicate predicateWithFormat:@"SELF IN %@",name2]; // 交集
    filterArray = [name1 filteredArrayUsingPredicate:predicate];
//    [MyLog info:@"%@", filterArray];

    // 字符串关键字 BEGINSWITH,ENDSWITH,CONTAINS [c]不区分大写,[d]不区分读音,[cd]不区分大写和读音,LIKE匹配,正则表达式
    // [*不定个字符,?单个字符]
    predicate = [NSPredicate predicateWithFormat:@"SELF.name BEGINSWITH[cd] 'XIAO' AND SELF.name LIKE[cd] '*tia?'"];
//    [MyLog infoBool:(BOOL)[predicate evaluateWithObject:user] key:@"String Keyword Predicate"];
}

@end
