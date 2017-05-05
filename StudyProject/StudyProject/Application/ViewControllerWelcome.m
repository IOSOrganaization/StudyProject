//
//  ViewControllerWelcome.m
//  StudyProject
//
//  Created by XiaoTian on 12/27/14.
//  Copyright (c) 2014 XiaoTian. All rights reserved.
//

#import "ViewControllerWelcome.h"

@interface ViewControllerWelcome ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation ViewControllerWelcome

- (void)viewDidLoad {
    [super viewDidLoad];
    // UIViewController 控制器标题 Title
//    [[self.navigationController navigationBar] setBarStyle:UIBarStyleBlack];
//    [self setTitle: NSLocalizedString(@"appName", nil)];
    UIView *viewContainer = self.view;
    viewContainer.backgroundColor = [UIColor whiteColor];
    // UILabel
    UILabel *uiLabel = [[UILabel alloc] init];
    [uiLabel setFont: [UIFont fontWithName:nil size: 18]];
    [uiLabel setTextColor: [UIColor blackColor]];
    [uiLabel setNumberOfLines: 5];
    [uiLabel setText: @"欢迎进入本项目,这个项目是XiaoTianTian的第一个IOS框架学习项目哦,期待探索新技术,期待在IOS上留下美好的回忆."];
    UILabel *uiLabelCopyright = [[UILabel alloc] init];
    [uiLabelCopyright setFont: [UIFont fontWithName: @"28 Days Later" size:12]];
    [uiLabelCopyright setTextColor: [UIColor grayColor]];
    [uiLabelCopyright setText: @"Copyright (c) 2014 XiaoTian. All rights reserved(-XT)"];
    //
    [viewContainer addSubview: uiLabel];
    [viewContainer addSubview: uiLabelCopyright];
    [uiLabel setTranslatesAutoresizingMaskIntoConstraints: NO]; // 声明使用约束方式控制自动大小的View的位置[自动大小View会自动声明View位置]
    [uiLabelCopyright setTranslatesAutoresizingMaskIntoConstraints: NO];
    // 添加现在约束[必须是父->添加->子的层次关系]
    // 添加自动布局约束[相对位置约束布局]
    // 相对父容器(布局)约束居中[attribute1 = multiplier × attribute2 + constant]
    // 设置高度 60pt
    [uiLabel addConstraint:[NSLayoutConstraint constraintWithItem:uiLabel attribute:NSLayoutAttributeHeight relatedBy:0 toItem:nil attribute:0 multiplier:0 constant:90]];
    // 设置相对父容器靠左距离
    [viewContainer addConstraint:[NSLayoutConstraint constraintWithItem:uiLabel attribute:NSLayoutAttributeLeft relatedBy:0 toItem:viewContainer attribute:NSLayoutAttributeLeft multiplier:1 constant:10]];
    // 设置靠右距离
    [viewContainer addConstraint:[NSLayoutConstraint constraintWithItem:uiLabel attribute:NSLayoutAttributeRight relatedBy:0 toItem:viewContainer attribute:NSLayoutAttributeRight multiplier:1 constant:-10]];
    // 设置上下居中
    [viewContainer addConstraint:[NSLayoutConstraint constraintWithItem:uiLabel attribute:NSLayoutAttributeCenterY relatedBy:0 toItem:viewContainer attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    // 靠下
    [viewContainer addConstraint:[NSLayoutConstraint constraintWithItem:uiLabelCopyright attribute:NSLayoutAttributeLastBaseline relatedBy:0 toItem:viewContainer attribute:NSLayoutAttributeBottom multiplier:1 constant:-20]];
    // 靠右
    [viewContainer addConstraint:[NSLayoutConstraint constraintWithItem:uiLabelCopyright attribute:NSLayoutAttributeRight relatedBy:0 toItem:viewContainer attribute:NSLayoutAttributeRight multiplier:1 constant:-10]];
    //
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *actionButtonItems = @[shareItem, cameraItem, addItem];

    //[[self navigationItem] setRightBarButtonItems:actionButtonItems];// 从右到左排列按钮
    //[[self navigationItem] setLeftBarButtonItem:[[self splitViewController] displayModeButtonItem]];
    //[[self navigationItem] setLeftItemsSupplementBackButton:YES];
}

#pragma mark - UISplitViewController Protocol

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation{
    // 屏幕方向改变时触发
    [XTFMylog info: @"屏幕方向改变时触发"];
    return YES;
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController{
    // 展开控制器触发
    [XTFMylog info: @"展开控制器触发"];
    barButtonItem.title = @"Master";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];

    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    //
    [XTFMylog info: @"收起控制器触发"];
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
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
