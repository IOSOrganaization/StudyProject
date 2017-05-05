//
//  ViewPosition.m
//  StudyProject
//
//  Created by XiaoTian on 14-10-23.
//  Copyright (c) 2014年 XiaoTian. All rights reserved.
//

#import "ViewPosition.h"

@interface ViewPosition ()

@end

@implementation ViewPosition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIView* view1 = [[UIView alloc]initWithFrame:CGRectMake(113, 111, 132, 194)];
    view1.backgroundColor = [UIColor colorWithRed:1 green:.4 blue:1 alpha:1];
    UIView* mainView = self.view;
    UIView* view2 = [[UIView alloc]initWithFrame:CGRectInset(view1.bounds, 10, 10)];
    view2.backgroundColor = [UIColor colorWithRed:5 green:1 blue:0 alpha:1];
    [mainView addSubview:view1];
    [view1 addSubview:view2];
    //
    CGRect r = view1.bounds;
    r.origin.x += 10; // Frame的大小x值
    r.origin.y += 10;
    view1.bounds = r;
    // 映射转换->旋转
    view1.transform = CGAffineTransformMakeRotation(45 * M_PI/180.0); // 设置旋转[弧度]
    // 映射转换->缩放
    view1.transform = CGAffineTransformMakeScale(1.8, 1);
    // 映射转换->移动
    view2.transform = CGAffineTransformMakeTranslation(100, 0);
    // 在transform的基础上叠加transform [ 在view2.transform上rotate ]translation and then rotate
    view2.transform = CGAffineTransformRotate(view2.transform, 45 * M_PI/180.0);
    // 两个transform Concat 合并两个映射(利用矩阵乘法的方式)
    CGAffineTransform transformR = CGAffineTransformMakeRotation(45 * M_PI/180.0);
    CGAffineTransform transformT = CGAffineTransformMakeTranslation(100, 0);
    view2.transform = CGAffineTransformConcat(transformR, transformT); // not R,T
    // 移除transform Concat(Invert(R),R+T)->T,Invert:反转矩阵
    view2.transform = CGAffineTransformConcat(CGAffineTransformInvert(transformT), view2.transform);
    view2.transform = CGAffineTransformMake(1, 0, -0.2, 1, 0, 0);
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(view1.bounds), CGRectGetMidY(view1.bounds));
//    [MyLog infoPoint:centerPoint];

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
