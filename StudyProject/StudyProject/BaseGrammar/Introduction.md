# Document 项目说明文档


# 图片资源说明 iPhone 6 Plus[1242*2208 @3x],iPhone 6[750*1334 @2x] 通常只加@2x的资源就可以
1.APP icon 程序图标[必须]
    a.iPhone 6 Plus: 180*180 [@3x]
    b.iPhone 6/iPhone 5/iPhone 4s: 120*120 [@2x]
    c.iPad/iPad mini: 152*152 [@2x]
    d.iPad 2: 76*76 [@1x]
2.APP Store APP icon[必须] 发布到商城预览照片: 1204*1204
3.Launch File/ Launch Image 启动页面/启动照片
    a.iPhone 6 Plus 布局文件方式
    b.iPhone 6/iPhone5 布局文件方式或者启动照片 640*1136
    c.iPhone4s 只能是启动照片 640*960
    d.iPad 只能是启动照片 1536*2048
    e.iPad mini 只能是启动照片 768*1024
4.Spotlight icon 底部展示栏图标
    a.iPhone 6 Plus: 87*87
    b.iPhone 6/iPhone 5/iPhone 4s 58*58
    c.iPad/iPad mini: 29*29
5.Spotlight search result icon 主页搜索结果图标
    a.iPhone 6 Plus: 120*120
    b.iPhone 6/iPhone 5/iPhone 4s:80*80
    d.iPad mini: 40*40


# 预加载头
1.创建预加载头xxxx-Prefix.pch
2.编写预加载头需要引入的头文件
3.配置项目的预加载头
    a.项目属性 -> Targets输出目标属性 -> Apple LLVM 6.0 - Language -> Prefix Header = xxx/xxx/xxx-Prefix.pch
    b.头文件的路径可以是绝对路径,也可以是项目工程文件的相对路径[必须是项目工程文件开始的相对路径]
4.开启预编译头 项目属性 -> Targets输出目标属性 -> Apple LLVM 6.0 - Language -> Precompile Prefix Header = Yes

# 设置编译器编译源的语言 
1. 项目属性 -> Targets输出目标属性 -> Apple LLVM 6.0 - Language -> Compile Source As = According to File Type
    a. According to File Type[根据文件类型编译]
    b. C[按照C语言语法进行编译]
    c. Objective-C[按照Objective-C语言语法进行编译]
    d. C++[按照C++语言语法进行编译]
    e. Objective-C++[按照Objective-C++语言语法进行编译]
