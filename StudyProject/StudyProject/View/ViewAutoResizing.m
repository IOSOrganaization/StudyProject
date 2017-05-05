//
//  ViewAutoResizing.m
//  StudyProject
//
//  Created by XiaoTian on 10/27/14.
//  Copyright (c) 2014 XiaoTian. All rights reserved.
//
#import "Headers.h"
#import "ViewAutoResizing.h"

@interface ViewAutoResizing ()
@end

@implementation ViewAutoResizing

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* mainView = self.view;
    [self transiteAutoresizingMask:mainView];
}

-(void) autoResizingView:(UIView *) mainview{
    // Do any additional setup after loading the view.
    UIView* v1 = [[UIView alloc] initWithFrame:CGRectMake(100, 111, 132, 194)]; //(x,y,width,height)
    v1.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    UIView* v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 132, 10)]; // width,height
    v2.backgroundColor = [UIColor colorWithRed:5 green:1 blue:0 alpha:1];
    // 添加View到相对位置
    UIView* v3=[[UIView alloc] initWithFrame:CGRectMake(v1.bounds.size.width-20, v1.bounds.size.height-20, 20, 20)];
    v3.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    [mainview addSubview:v1];
    [v1 addSubview: v2];
    [v1 addSubview: v3];
    // 子层自动布局
    // 声明自动布局的约束:
    // 1.在代码中声明每一个独立的自动布局约束
    // 2.在nib故事版中选中"Use Auto Layout"自动布局属性
    // 3.继承UIView 重写requiresConstraintBasedLayout方法并且返回true实现自动布局
    v2.autoresizingMask = UIViewAutoresizingFlexibleWidth;// 弹性宽度[自动适应宽]
    v3.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;// [自动适应顶,宽]
    CGRect r = v1.bounds; // 重新设置Root View的bounds
    r.size.width += 40;
    r.size.height -= 50;
    v1.bounds = r;
}

// translatesAutoresizingMaskIntoConstraints:转换自动大小覆盖约束
-(void)transiteAutoresizingMask:(UIView*)mainview{
    UIView* view1=[[UIView alloc]initWithFrame:CGRectMake(100, 111, 132, 194)];
    view1.backgroundColor=[UIColor colorWithRed:1 green:0.4 blue:1 alpha:1];
    UIView* view2=[UIView new];
    view2.backgroundColor=[UIColor colorWithRed:0.5 green:1 blue:0 alpha:1];
    UIView* view3=[UIView new];
    view3.backgroundColor=[UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    [mainview addSubview: view1];
    [view1 addSubview: view2];
    [view1 addSubview: view3];
    // 自动大小约束(自动布局:声明位置,大小相对值由系统自动匹配)
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view3.translatesAutoresizingMaskIntoConstraints = NO;
    // 布局约束:约束者:约束属性:关联性:相对于约束者对象:约束属性:乘数:常量 (a1=m*a2+c)
    // View1约束View2[靠右上位置]
//    NSLayoutConstraint* constraint=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeft relatedBy:0 toItem:view1 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
//    [view1 addConstraint:constraint];
//    NSLayoutConstraint* constraintRight=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeRight relatedBy:0 toItem:view1 attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//    [view1 addConstraint:constraintRight];
//    NSLayoutConstraint* constraintTop=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:0 toItem:view1 attribute:NSLayoutAttributeTop multiplier:1 constant:0];
//    [view1 addConstraint:constraintTop];
//    // View2自身约束[设置高度]
//    NSLayoutConstraint* constraintHeight=[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:0 toItem:nil attribute:0 multiplier:1 constant:10];
//    [view2 addConstraint:constraintHeight];
//    // View3自身约束[设置宽度,高度]
//    NSLayoutConstraint* constraintWidth=[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeWidth relatedBy:0 toItem:nil attribute:0 multiplier:1 constant:20];
//    [view3 addConstraint:constraintWidth];
//    NSLayoutConstraint* constraintHeight_3=[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeHeight relatedBy:0 toItem:nil attribute:0 multiplier:1 constant:20];
//    [view3 addConstraint:constraintHeight_3];
//    // View1约束View3[靠右下位置]
//    NSLayoutConstraint* constraintRight_1=[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeRight relatedBy:0 toItem:view1 attribute:NSLayoutAttributeRight multiplier:1 constant:0];
//    [view1 addConstraint:constraintRight_1];
//    NSLayoutConstraint* constraintBottom=[NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeBottom relatedBy:0 toItem:view1 attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
//    [view1 addConstraint:constraintBottom];
    // 简单选择可视语法配置约束(Visual Format Syntax)
    // H:横向,V:竖向
    // |:适配到的位置(alignments)
    // [变量名]:目标View
    // @"H:|[view2]|" :横向view2的左右两边自动延伸大小
    // @"V:|[view2(10)]" :竖向view2上边界高度10
    NSDictionary* vs = NSDictionaryOfVariableBindings(view2,view3);// 绑定变量
    [view1 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view2]|" options:0 metrics:nil views:vs]];
    [view1 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view2(10)]" options:0 metrics:nil views:vs]];
    [view1 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view3(20)]|" options:0 metrics:nil views:vs]];
    [view1 addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view3(20)]|" options:0 metrics:nil views:vs]];
//    [MyLog info:@"transiteAutoresizingMask:转换自动大小覆盖约束,用约束的方式设置View的位置和大小"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
