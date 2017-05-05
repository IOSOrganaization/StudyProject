# Storyboard 故事版
1.利用故事版模式可以快速构建你的程序UI,通过故事版最大的好处是可以在故事版中查看到所有的用户UI以及UI的关联关系.
2.如果APP程序有很多不同页面,使用故事版可以减少页面跳转关联代码,故事版可以使用多个文件声明每个视图控制器(view controller)但是使用一个故事版在APP中可以很方便的设计和控制所有的页面和页面的关联关系
-- your app uses a single storyboard that contains the designs of all of these view controllers and the relationships between them
3.故事版文件: .xib 或者.storyboard[使用故事版后不再使用.xib布局文件]
4.故事版会以相同设备的分辨率显示,所以如果要设置大分辨率的APP(IPAD)则要用到更大的显示器才可以看到全部的页面和关联,同时如果你想在程序内部(通过代码的形式)创建实体UI,那么请不要使用故事版
5.如果你只想少写一点页面的布局关联代码则使用故事版是个很好的选择
6.故事版不能直接通过故事版进行联系,也就是多个故事版文件不能直接关联
7.程序加载StoryBoard过程: 
    1.如果AppDelegate重写了[didFinishLaunchingWithOptions:]方法,并且初始化页面,则系统通过该方法初始化 
    2.如果AppDelegate没有在[didFinishLaunchingWithOptions:]初始化页面,系统通过Info.plist配置的Main storyboard file base name初始化指定的页面(可以在项目配置中设置)
    3.
8.使用storyboard在设计页面时查看结果页面布局,实时动态改数据[在storyboard中添加模板数据可以直接查看效果结果]
9.

# 使用方法
1.创建项目时选择使用故事版模式
2.项目创建后会包含一个.storyboard文件,这个是故事版文档,默认不会创建.xib类型的故事版子文件,你也可以使用.xib故事版文件
3.新建故事版.storyboard不包含任何的组件
4.故事版左边的是文档导航,右边是控件/工具导航
5.为每个UI添加ViewController页面控制器
6.设置ViewController初始化入口(视图属性->视图控制器->初始化视图入口 [is initial view controller])
7.开始为视图添加组件,关联相应的方法及跳转
8.如果在AppDelegate中初始化了self.window或self.window.rootViewController那么程序不会实例化配置的storyboard
9.取消storyboard: 
    1.在AppDelegate中初始化self.window或self.window.rootViewController
    2.在Info.plist中删除[Main storyboard file base name]属性声明

# 自动布局使用方法
1.选中要开启自动布局的故事版,选中文件属性对话框,选中开启自动布局[Use Auto Layout](Use Size Class是否使用指定大小模式的故事版,v8.0加入可以为以前的设备专门设置一个故事版布局)
2.选中要自动布局的组件,选择窗口下部的自动布局按钮添加自动布局约束[Add New Constraints]
3.设置组件的自动布局约束时必须要拖动组件到基线位置,然后开始设置相应的约束[约束是两个组件之间的相互约束或者与父组件之间的相互约束],当拖动时系统会自动检测要绑定约束的对象[高亮线显示]
4.约束条件在运行时显示,在界面仅仅显示布局的效果图,实际的结果不一定与设计图相同,因为有约束可能有冲突或者相对的位置或者大小在页面设计时不一定按实际设备比例显示
5.选择Storyboard的类型在页面加载时有效,当页面第一次加载时会直接加载故事版的配置,包含故事版的适配配置,故事版适用配置w,h在加载时会设置相应的默认屏幕宽高[通过选择w,h的类型设置相应的屏幕大小]

# 组件映射到实体类配置
1.在故事版中拖拉放好相应的组件,同时根据需要设置好布局[主要是自动布局/绝对布局]
2.选中相应的页面UI组件,打开文件属性窗口,在Custom Class 中填入相应的映射Module和Class即可绑定自定义映射UI组件到类
3.

#组件映射到属性变量配置
1.添加组件到Storyboard的指定的实体页面中
    a.添加到指定的指定页面的指定容器组件内部,拖到组件到系统默认固定的组件内部
    b.添加到指定页面,不添加到容器中,拖动组件到页面的页面头部,系统仅仅添加该组件到该页面
2.打开组件视图,storyboard右下角的展开按钮,选中Reference Outlets,拖动到要绑定的实体类,选着要绑定的变量名称.注意:[实体中的变量必须声明[为IBOutlet]为:@property (nonatomic, retain) IBOutlet UIImageView *image;]
3.UIViewController 默认包含一个view变量,直接拖到的第一个组件会被自动绑定到view变量中

# 事件绑定配置
1.绑定配置接口协议,选中要绑定的组件,右击选中要绑定协议,连接绑定到实体类[该实体必须要实现接口协议]
2.绑定按钮事件,选中按钮,右击选中要绑定的事件[系统事件:Triggered Suggest,用户自定义事件:Send Actions],注意用户自定义事件的方法标识为:-(IBAction) actionName:(id)sender
3.

# 获取storyboard中声明的组件
1.声明组件的Identity中的Storyboard ID,同时要选择开启Storyboard ID模式
2.根据Storyboard ID 创建绑定的实体控制器(每次创建新实体不是引用)[self.storyboard instantiateViewControllerWithIdentifier:@"UICatalogMaster"]
3.故事版中有固定的视图组件,固定组件不能设置身份Identity ID,而是通过系统中的默认组件的方式获取引用[获取根视图为控制器的引用: UIViewController *rooViewController = self.view]
4.通过这种方式获取的是storyboard中的Document文件属性中声明的Identity组件

# 故事版中页面跳转
1.创建需要跳转的两个页面控制器[ViewController或子类]
2.选中页面需要跳转的触发按钮/组件 -> 打开组件的
3.不同的页面控制器之间通过Storyboard Sugue进行连接,通两个控制器之间可以有多个连接,连接通过声明ID[identify]进行区分
4.在代码中执行指定的连接: performSegueWithIdentifier:sender:从指定页面控制器执行其声明ID的连接
5.

# 编译后的故事版
1.所有的故事版都会经过编译,编译后打包到程序中的故事版要在项目中配置拷贝到Bundle资源包中
2.编译后的故事版的扩展名为.storyboardc[多了一个c声明为已编译]

# 组件属性说明:
1.文件属性
    a.Identity and Type 标识和类型
    b.Localization 文件地址
    c.Target Membership 输出目标成员[输出到的目标]
    d.Text Settings 文件文本设置
    e.Source Control 文件资源管理
2.故事版标识属性
    a.Custom Class 映射的用户定义类
    b.Identity 组件标识
    c.User Defined Runtime Attribute 使用的默认属性值
    d.Document 组件在故事版中的文档属性
3.组件属性[根据组件类型不同,参数的设置不同]
    a.Simulated Metrics 外观度量[计算]设置
    b.View Controller 视图控制设置
    c.View 视图设置[背景,隐藏性,交互性,多点击性等]
    d....
4.组件外观[大小位置]属性[根据组件类型和层次关系有不同的外观属性设置]
    a.View Controller 视图控制器外观设置
    b.View 视图外观设置[位置,大小]
    c.Label 标签外观设置
    d...
5.组件连接属性[根据组件类型会有不用的属性连接]
    a.Outlets 组件内部变量映射连接出口[storyboard到属性变量向外(实体类Custom Class 属性变量)连接的出口]
    b.Referencing Outlets 用户添加组件映射引用出口
    c.Referencing Outlet Collections 用户添加组件映射引用出口链接集合[触发组件->链接函数->触发目标事件]
    a.Outlet Collections 组件内部变量/属性连接出口集

# 常见组件使用属性说明:
1.UIScrollView 滚动视图管理器
    a.Style 滚动视图样式
    b.Scroll Indicators 滚动条指示器
    c.Scrolling 滚动状态[Scrolling Enable:开启滚动,Paging Enable:分页滚动,Direction Lock Enable:锁定滚动方向]
    d.Bounce 滚动回弹
    e.Touch 触摸事件[Bounces Zoom:回弹放大,Delays Content Touches:内容触摸延迟,Cancellable Content Touches:内容触摸可取消]
2.

# Requirements

### Build

iOS 8 SDK

### Runtime

iOS 8, 64 bit devices

Copyright (C) 2014 XiaoTian . All rights reserved.