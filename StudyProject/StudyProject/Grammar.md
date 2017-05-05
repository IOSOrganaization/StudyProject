# Object-C语法

1. Object-C字符串:@"name",C语言字符串:"name"
2. nil :如果对nil空值执行方法调用不会包异常,而且会被系统直接忽略不执行任何操作[nil,没有空值异常的概念]
3. alloc :系统执行分配实体堆连续的快内存,对实体变量[variable]进行分配空间
4. 堆内存中的实体中的变量是不包含的关系,即使是实体中的变量也是同时放在堆内存中并列不会关联,实体和变量之间只是保存了地址[pointer]的关联而非变量的实体,所以一个实体所占的堆内存大小只包含基本类型的大小和对象类型的地址指针[指针:4byte]
5. 堆/栈 :
    a.堆是一个巨大的内存空间,用于存放各种的实体,这些实体都是通过堆地址的形式来被引用的
    b.栈形象来说是机器和程序的通道,栈是在运行方法[function/method]的时候才分配内存,这些内存用于存放本地/局部变量
6. APP运行时 main函数会添加到栈低,当main调用其他方法[function/method]时,调用的方法会添加到栈顶,一层一层的压入栈顶,当重复调用同一方法时,每次都是新frame[帧]入栈,栈中的方法不会被重复调用
7. 内存溢出[memory leak] :没有任何引用的栈内存对象并且又没被回收的实体内存快
8. 过早释放[premature deallocation] :当还有指针引用时而该指针对应的内存实体已经被释放,而这时对指针进行访问[XCode有漏洞工具可以检查 Leaks Tool]
9. 当设置变量值=nil时,系统会调用改对象的dealloc销毁方法
10. weak :弱引用,__weak variable, 对象的变量默认为强引用,如果要弱引用必须要弱引用[如果子成员要引用父或者父的父对象那么对父的引用必须要用弱引用]
11. strong :强引用,两个变量对象之间同时用引用对方会导致引用环死锁,这时ARC也无法回收内存必须手动回收,所以不要随意使用强引用[用强引用避免混乱成员属性]
12. nonatomic or atomic :用于多线程下什么的属性
13. readwrite or readonly :readwrite[默认]声明属性的getter/setter,readonly只声明getter
14. synthesize :合成属性的方法getter/setter方法[系统自动生成该方法,不用手动写],可以一次性合成多个属性,只有当你要重写getter和setter的时候才不需要合成属性的getter/setter
15. copy :拷贝的方式创建属性[初始化变量时拷贝的方式,不是地址引用]
16. autoreleasepool :@autoreleasepool{} 声明自动释放池的块,当执行完后,快中的变量会被销毁
17. id<ClassName> :泛型地址,指定地址的类型
18. retain :声明对变量进行引用[注意:如果同时开始ARC和声明retain系统会报EXC_BAD_ACCESS异常系统自动垃圾回收不能使用显示引用标识]
19. @class :预声明类,声明不检测类的存在性[方便直接编写程序,编译时要在引用的地方引入@class的实体类,否则编译器检测不到声明类的成员]
20. .h:头文件,.m:Object-C或者C的实体类文件,.mm:Object-C或者C或者C++的实体文件,.cpp:C++的实体文件
21. assert:断言(如果条件为真则抛异常断掉与上下文链接)控制调式的结束位置
22. extern:声明为[外部]全局变量,可以声明变量或者方法,声明为已被初始化了的全局变量,可能在本类文件初始化也可能在其他文件里初始化了的
23. __bridge: ARC环境下关键字来实现id类型与void*类型的相互转换[Objective-C转换为C类型引用]
24. @: IOS中Object-C语法特殊标识符
    1 代码体内部使用@语法
    a. @"string" 初始化一个NSString,返回 NSString *
    b. @(expression) 初始化一个表达式,返回 id
    c. @[objects,...] 初始化一个数组,返回 NSArray *
    d. @autoreleasepool{} 使用自动计时器处理的代码
    e. @encode(type-name) 编码指定类型名为char数组,返回 char[]
    f. @protocol 初始化一个接口协议类,返回一个Protocol
    g. @selector(selector) 获取一个方法选择器,返回SET
    h. @throw expression 抛出异常
    i. @try{} @catch(NSException e){} @finally{} 扑捉异常
    j. @{key,object,...} 初始化一个字典集合,返回 NSDictionary *
25. @import:使用@import引入已声明的模块时,必须设置项目中的开启使用模块[Apple LLVM 6.0 - Modules -> Enabled Modules(C and Object-C) = Yes]
26. @autoreleasepool: ARC环境下的什么自动计时器代码段,用于代替非ARC下得NSAutoreleasePool对象控制的代码段
27. ARC环境下Objective-C与C/C++类型转换[对象管理桥接 Manageing Tool-Free Bridging]
    a. C/C++[void *] 语言类型转换 Objective-C[id] id objective = (__bridge type) expression[C/C++类型];
    b. Objective-C[id] 语言类型转换 C/C++[void*] void *cMethod =  (__bridge type) expression[Objective-C类型];
    c. CF框架[Code Foundation Framework]对象指定转换器,CFBridgingRelease(CFTypeRef):CF指针类型转换为id,CFBridgingRetain(id):id类型指针转换为CFTypeRef指针类型[可以用__bridge进行转换],CF中的对象不会自动管理对象内存,所以在CF中使用后的的对象必须使用CFRetain,CFRelease进行内存管理
    d. __bridge: 转换Object-C指针类型为CF指针类型,不转移对象所有权
    e. __bridge_retained or CFBridgingRetain: 转换Object-C指针类型为CF指针类型,并且转移所有权被用户操作,用户必须负责调用CFRelease或相关方法进行所有权释放
    f. __bridge_transfer or CFBridgingRelease: 转移非Object-C指针类型为Object-C指针类型,并且同时转换对象所有权到ARC控制,ARC负责所有权释放回收内存
    g. 例子:
        1.CF -> Object-C: 
            ABRecordRef person = ' An ABRecodRed Object '
            NSString *name = (NSString *)CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        2.Object-C -> CF:
            NSArray *colors = ' An array of colors '
            CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
28. NSAssert: 断言/结束线程函数,第一个参数为结束判断条件,如果条件为NO则结束,并输出说明语句,系统会自动添加源文件的代码行数到数据结尾
29. @Property类属性声明关键字
    a.性能属性: weak(弱引用,系统初始化分配nil),strong(强引用)
    b.生命周期属性: __strong,__weak,__unsafe_unretained,__autoreleasing
    c.非ARC中属性关键字: weak,
    d.ARC中属性关键字:
30. 非ARC源转换为ARC,通过系统提供的一个插件功能可以完成标准的非ARC直接转换为ARC[编辑(Edit) -> 重构(Refactor) -> 转换为Object-C的ARC模式(Convert To Object-C ARC...)]
31. ARC中不能使用的关键字方法: dealloc,retain,release,retainCount,autorelease,@selector(retain),@selector(release)
32. ARC中不能使用类 NSAlloateObject,NSDeallocateObject,NSAutoReleasePool[使用@autoreleasepool{}代替]
33. ARC中不能使用空内存NSZone对象,这个对象会在Object-C运行时忽略
34. @property(getter=myGetterMethod,setter=mySetterMethod) NSString *customGetterSetter; 自定义连接Getter/Setter方法
32. 如果用户重写dealloc,那么用户不能调用[super dealloc]方法
33. 在ARC中不建议在机构体struct中使用Object-C 对象,如果一定要使用对象则采用__unsafe_unretained声明为非安全引用对象
34.


# 动态库引入 [引入libxml2.dylib]
1.添加动态库文件引用[要添加的项目->Build Path->Link Binary With Liberaries->添加libxml2.dylib]
2.添加动态库头搜索路径[要添加的项目->Search Paths->Header Search Paths->$SDKROOT/usr/include/libxml2]

# 单例模式
1.dispatch_once 单例创建模式方法执行一次,Executes a block object once and only once for the lifetime of an application.
2.

# 预编译头文件引入
1.创建预编译头文件[StudyProject-Prefix.pch]
2.配置项目引用预编译头文件,打开项目配置,选择输出Target -> Apple LLVM-6.0 Language -> Prefix Header = StudyProject/Supporting Files/StudyProject-Prefix.pch(文件相对于项目的具体路径Path)
3.预编译引入头,会自动添加到所有的源类文件中,必须在build target中设置预编译头[静态引入]

# id VS instance
1. id 是实体的地址可以用于任意地方
2. instance 是实体对象的返回值,只能用于返回值一般用于实体初始化是返回当前的实体[声明为实体泛型而不是id,当然可以在初始化时返回id]

# NSAssert vs NSCAssert[带参数:NSParameterAssert / NSCParameterAssert]
1.两者都是用在[调式时]控制程序结束抛异常的标识,传入0控制台输出描述,并抛出异常结束进程
2.NSAssert只能用在Object-C上下文中[method,implementations等内部],NSCAssert只能用在C上下文中[functions内部]
3.methods / functions should use NSAssert / NSCAssert statements,


# 图片/其他 资源
1.其他资源文件当复制到项目环境中时,会自动添加到程序输出bundle目录中,如果不想某个资源输出到程序包,应该在程序输出目录配置中取消该文件资源的输出
2.所有资源默认输出到程序bundle的根目录下,如果要改变资源输出的路径,则要创建文件输出路径设置
    a.创建文件输出到APP路径[项目属性->输出目标 TARGETS ->编译配置 Build Phases ->添加 +号 ->新建文件输出拷贝路径 New Copy File Path]
    b.选择拷贝到的目的地 Destination :
        1.Absolute Path 拷贝到绝对路径目录
        2.Products Directory 拷贝到产品目录
        3.wrapper 拷贝到安装包目录
        4.Executables 拷贝到可执行文件目录[程序路径]
        5.Resource 拷贝到项目资源内部目录[Bundle 方式读取]
        6.Plugins 拷贝到插件目录
3.
