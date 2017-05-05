Swift 基本语法:

1.Swift 中一切均为对象,完全面向对象编程,Swift中包含三种类型的对象,class,strut,enum. 没有元数据,元数据也是对象,例如数字1也是对象,是一个struct对象,包含struct的所有方法,并且可以扩展
2.Swift属性采用驼峰发命名比较好
  1,let ()声明常量:: let声明的常量不可以在赋值
  2,var (variable)声明变量

3.Swift语句分隔可以用[换行符 也可以用;分号](当同一行有多个语句时必须用;分隔),当然每一行用;分隔也是合法的
4.Swift类有三种:class,struct,enum,所有的类都可以包含其他类,属性,函数

5.声明Swift类向Object开放访问: @objc, 同时该类要继承Object-C的NSObject根对象
6.在Object-C类中引入Object-c -> Swift映射头文件: <工程项目名称>-swift.h (所有@objc注解的类都会自动创建Object-c的访问头在该映射文件中)
7.Object-C调用Swift面向Object-C的开放实体类(向Object-C开放的实体不能忽略外部函数参数名)
//
1. main.swift程序入口函数文件
2. @UIApplicationMain声明程序入口类