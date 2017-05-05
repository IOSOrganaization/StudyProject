//
//  UICatalogSplitViewController.m
//  StudyProject
//
//  Created by XiaoTian on 1/10/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "UICatalogSplitViewController.h"

@interface UICatalogSplitViewController ()

@end

@implementation UICatalogSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [XTFMylog info:@"UICatalogSplitViewController@viewDidLoad"];
    // 优先显示所有UI控制器
    [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    [self setDelegate:self];
    UIViewController *masterViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UICatalogMaster"];
    UIBarButtonItem *buttonDismiss = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *leftBarButtonItems = [[masterViewController navigationItem] leftBarButtonItems];
    leftBarButtonItems = [leftBarButtonItems arrayByAddingObjectsFromArray:@[buttonDismiss,addItem]];
    [[masterViewController navigationItem] setLeftBarButtonItems:leftBarButtonItems];
    [XTFMylog info: masterViewController];
    [XTFMylog info: [masterViewController title]];
    [XTFMylog info: [[masterViewController navigationItem ]title]];
    [XTFMylog info: [[masterViewController navigationItem ] leftBarButtonItems]];
    for(UIBarButtonItem *b in [[masterViewController navigationItem ] leftBarButtonItems]){
        // [XTFMylog infoClassField:b];
        [b setAction:@selector(dismissViewController)];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [XTFMylog info:@"UICatalogSplitViewController@didReceiveMemoryWarning"];
    // Dispose of any resources that can be recreated.
}

// 关闭页面
-(void) dismissViewController{
    [XTFMylog info:@"UICatalogSplitViewController@dismissViewController"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISplitViewControllerDelegate
// 显示模式,返回显示所有
- (UISplitViewControllerDisplayMode)targetDisplayModeForActionInSplitViewController:(UISplitViewController *)splitViewController {
    [XTFMylog info:@"UICatalogSplitViewController@targetDisplayModeForActionInSplitViewController:splitViewController:"];
    return UISplitViewControllerDisplayModeAllVisible;
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
