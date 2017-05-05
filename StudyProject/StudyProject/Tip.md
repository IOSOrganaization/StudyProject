# 使用技巧

# 设置
1.XCode有两个方面的属性设置
    a.是开发编译环境:选择项目 -> Project -> 设置编写/编译的环境
    b.是编译时的环境:选择项目 -> Target -> 设置编译目标APP的环境
    c.注意:两者是不同的配置环境来的,编译/编写环境和编译目标环境不能交互
2.

# 模拟器

# 扩展现有类成员 Category Method
1.可执行类成员扩展: NSString+PECrypt.h  ---> NSString : class name, PECrypt : category name[+号或者-号意义都是一样的,对实体类进行扩展成员而不用继承的方式去扩展]
2.扩展的类不用特别声明,直接在原类中引用扩展成员就可[系统默认会为当前的全部该类添加扩展成员]

# 错误:
1.[use of '@import' when modules are diableed]@import 使用@import时必须要开启模块化 Build Target -> Enable Modules -> 输出Target要开启,同时开启自动连接Binary那样就不用手动去添加link binary 了
3.

