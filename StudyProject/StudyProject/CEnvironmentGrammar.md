# 基本关键字语法
1. #import 引入头文件/引入框架/引入动态库,系统自动检测并取消重复引入头
2. #if 编译环境判断表达式 if
3. #else 编译环境判断表达式 else
4. #elseif /#elif 编译环境表达式 else if
5. #endif 编译环境if表达式结束
6. #error 编译环境编译抛出错误
7. #define 编译环境的宏定义,编译时直接替换
8. #if define(name) / #ifdef name 编译环境如果已经定义了name
9. #if undefine(name) /#ifndef name 编译环境如果没有定义name

# IOS 常用关键字
1. DEBUG 调式环境
2. TARGET_IPHONE_SIMULATOR 运行目标是iPhone模拟器
3. TARGET_OS_IPHONE 运行目标是iPhone操作系统
4.