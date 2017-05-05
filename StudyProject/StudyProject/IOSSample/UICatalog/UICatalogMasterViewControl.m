//
//  UICatalogMasterViewControl.m
//  StudyProject
//
//  Created by XiaoTian on 1/10/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "UICatalogMasterViewControl.h"
#import "Headers.h"

@implementation UICatalogMasterViewControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载关闭页面按钮

    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)];
    [self.navigationItem setLeftBarButtonItem:dismiss];
}

// 关闭页面
-(void) dismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
