# XCode快捷键

1. 快捷建:
2. 注解选中行: CMD+/
3. 取消注解选中行: CMD+/
4. 代码提示: ctrl+.
5. 编译运行: CMD+R
6. 编译调试: CMD+Y
7. 编译 : CMD+B
8. 清理 : CMD+Shift+K
9. 代码提示: Esc
10. 接受代码提示: Tab
11. 删除本行 : Ctrl+K
//
12.Command-0 :左边导航窗口 Navigator Pane [Command-1~8子菜单]
13.Command-Option-0 :右边工具窗口 Utilities Pane [Command-Option-1,2子菜单 file inspector]
14.Command-Control-Left :记录的上一个文件
15.Command-Control-Right :记录的下一个文件
16.Command-Return :代码编辑窗口编辑器 The Editor
17.Command-Option- Return :代码编程窗口协助编辑器 Assistants
18.Command-T :打开新Tab选项卡 Tabs
19.Command-Shift-T :打开新窗口
20.Command-Shift-}/{ :切换到上一个/下一个Tab窗口
21.Command-Shift-Y :底部的Debug控制台窗口
22.Command-Shift-F :在当前项目上下文中查找
23.Command-Option-Control-3 :右边工具窗口下面的UI组件窗口
24.Command-Option-L :右边工具窗口下面的Filter过滤器输入过滤
25.Command-Option-3 :右边工具窗口的对象库窗口 Object library
26.Command-Option-4 :右边工具窗口的媒体窗口 Media library
27.Command-Shift-0 :帮助文档
28.Command-L :跳转到第几行
# IOS 模拟器
1.  Command-Q :退出程序

# Nib编辑器
1. 查看一个View的属性bounds值(选中查看View,按住Option建,鼠标移出该View外部即可)
2. 拷贝一个View组件(选中View,按住Option建,点击选中的拷贝View,拖动到其他位置即可)
3. 查看一个View的绑定事件(选中View,按住Option-Control-click点击要查看的View即可)
4. 弹框选择层叠中的指定层的View(Control-Shift-click弹出当前所在位置的所有层叠的View列表)
5. 双击View,该View进入编辑模式
6. 按住control-点击UIView进行映射连接
7. File's Owner 用来声明该nib文件映射的实体类,通过Identity inspecter修改class属性,owner用于加载xib时自动映射类的属性loadNibNamed:owner
8. Nib属性UIView映射连接操作方式:
   a. 在文件持有者(File's Owner)的连接面板(Connection inspector)进制映射连接[文件持有者->document文档UIView]
   b. 在目标UIView的连接面板(Connection inspector)连接到文件持有者[UIView->文件持有者]
   c. 在源(File's Owner Source HUD)提示框Control-click文件次有者连接到UIView文档[文档持有者的源HUD提示框->document文档]
   d. 在目标的(document 文档 destination HUD)提示框Control-click UIView连接到文档次有者的HUD源提示框[document文档的UIView->文档持有者HUD提示框]
   e. 在代码属性连接到nib编辑器[代码TAB,NIB TAB借助于协助窗口,Code->Nib的document文档里面的UIView/场景里面的UIView]
   f. 在nib连接到代码上(新建映射连接)[同时也要借助协助窗口]在document文档上Control-click-drag UIView->Code代码窗口指定位置
   g. 集合映射连接 @IBOutlet var views : [UIView]! 和单个连接操作一样,但是连接成功后,会自动连接到集合里面Outlet Collections[可以在File's Owner里面看到连接集合的顺序和连接UIView信息]
10. Nib的Action事件映射连接[Action连接实际上是发事件消息message-sending reference]实际上这个只是事件的一种转送,所有的事件都是由UIControl进行处理,只是UIControl把对应得事件转送到绑定的映射连接里面(当然,单击,双击都是UIControl控制好了的)
11. @IBOutlet,IB: 声明想Nib公开的属性连接
    a.IBAction的连接方式和IBOutlet的连接方式一样
12. 配置Nib中的实例初始化
    a.如果要在nib加载完后执行自定义属性配置,那么在重写awakeFromNib方法后面添加操作即可,awakeFromNib将在该Nib的实例被初始化完成后被唤起的一个方法
    b.如果要在nib加载过程/加载时执行自定义的属性配置,那么要需要通过配置Nib的User Default Runtime Attribute属性进行对实例的参数进行配置,系统会在加载过程中会调用setValue:forKeyPath: message;方法对配置的属性进行配置设置
    c.如果用户自定义属性在Nib加载过程中要配置属性,那么要用到面向Nib的属性配置关键字声明@IBInspectable



