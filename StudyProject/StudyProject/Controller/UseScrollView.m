//
//  UseScrollView.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UseScrollView.h"
#import "UseButton.h"
#import "UseImageView.h"
#import "UseTableView.h"

@interface UseScrollView ()

@end

@implementation UseScrollView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // ScrollView 滚轴视图[卷轴位置]
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, 300, 400)]; // 创建ScrollView卷轴布局[卷轴](x,y,width,height)
    scrollView.contentSize= CGSizeMake(500, 500); // 卷轴ScrollView内容大小[卷轴内容:如果卷轴内容比卷轴小,则不滚动:0不滚动]
    scrollView.backgroundColor=[UIColor orangeColor]; // 卷轴背景
    scrollView.pagingEnabled=YES; // 卷轴分页[每一页自动匹配位置,NO:拖到哪里是哪里,页数:内容长度/卷轴长度]
    // x轴横拉
    view_a = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 100, 150)]; // 视图1(布局位置,相对与卷轴来布局)
    view_a.backgroundColor=[UIColor yellowColor]; // 视图1背景
    [scrollView addSubview:view_a]; // 添加到滚轴中
    //
    view_b = [[UIImageView alloc] initWithFrame:CGRectMake(250, 0, 100, 150)]; // 视图2(布局位置,相对与卷轴来布局)
    view_b.backgroundColor=[UIColor purpleColor]; // 视图2背景
    [scrollView addSubview:view_b]; // 添加到卷轴中
    
    [self.view addSubview:scrollView]; // 添加卷轴到View容器中
    scrollView.maximumZoomScale=2.0; // 卷轴最大放大比例
    scrollView.minimumZoomScale=0.5;// 卷轴最小缩小比例
    scrollView.delegate=self; // 卷轴事件委托
    scrollView.delaysContentTouches = YES; // 添加显示内容
    scrollView.canCancelContentTouches=NO; // 取消内容的点击事件
    scrollView.decelerationRate=1; // 减小步进
    
}
// 重写方法
//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *) inscrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,yis %f",inscrollView.contentOffset.x, inscrollView.contentOffset.y);
}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewWillBeginDragging");
}
//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    NSLog(@"scrollViewDidEndDragging");
}
//将开始降速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewWillBeginDecelerating");
}

//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndDecelerating");
}
//滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidEndScrollingAnimation");
}
//设置放大缩小的视图，要是uiscrollview的subview
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
{
    NSLog(@"viewForZoomingInScrollView");
    return view_a;
}
//完成放大缩小时调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale;
{
    view_a.frame=CGRectMake(0,0,100,400); // 设置视图1的位置布局
    NSLog(@"scale between minimum and maximum. called after any 'bounce' animations");
}// scale between minimum and maximum. called after any 'bounce' animations

// 点状态栏，那个可视的滚轴视图会一直滚动到顶部，那是默认YES
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewShouldScrollToTop");
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;
{
    NSLog(@"scrollViewDidScrollToTop");
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
// 系统方法
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
