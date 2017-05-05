# 自动布局(相对布局)约束

1.创建约束 NSLayoutConstraint* constraint=[NSLayoutConstraint constraintWithItem:uiLabel attribute:NSLayoutAttributeLeft relatedBy:0 toItem:nil attribute:NSLayoutAttributeCenterY multiplier:0 constant:0];
2.添加到布局中 [uiLabel addConstraint:constraint];
3.说明:
    a.约束条件只能在两个组件的两个属性之间进行设置[view1的x相对于view2的x的位置,view1的宽相对于view2的宽的比例...]
    b.约束计算法则 attribute1 == multiplier × attribute2 + constant
    c.约束不仅可以应用于两个同等级的视图,也可以应用于父子,子父等级别关联的视图中
    d.约束有优先级的关系,优先级高的优先设置(当有多个相同约束时)
    e.创建约束后必须添加到目标View中,注意不能对进行约束的进行添加否则会出现约束层次异常
4.布局属性说明:
    a.所谓的自动布局是指相对布局,根据组件View之间的相互关系进行相应的设置的布局方式
    b.IOS把一个View视图分解成多个位置点,然后获取到每一位置点的值,当需要自动布局添加了约束时,获取到一个View视图各个点值进行一系列的计算得到另一个视图相应的点的值
    c.


5.语法:
+(NSArray *)constraintsWithVisualFormat:(NSString *)format
options:(NSLayoutFormatOptions)opts
metrics:(NSDictionary *)metrics
views:(NSDictionary *)views

+ (instancetype)constraintWithItem:(id)view1
attribute:(NSLayoutAttribute)attr1
relatedBy:(NSLayoutRelation)relation
toItem:(id)view2
attribute:(NSLayoutAttribute)attr2
multiplier:(CGFloat)multiplier
constant:(CGFloat)