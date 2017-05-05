//
//  UseNavigatorController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-31.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "UseNavigatorController.h"
#import "MovieDetailViewController.h"
@interface UseNavigatorController ()
@property (strong, nonatomic) MovieDetailViewController *childController;
@end
@implementation UseNavigatorController
// 合并头声明变量属性
@synthesize controllerList;
@synthesize message;
@synthesize detailLabel;
@synthesize childController;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置Navigator control 导航对象的属性
    self.title = @"分类"; // 导航控制器标题
    message = @"Message!";
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"xiaoshenkedejiuxiu", @"教父: IT", @"低俗小说", @"黄金三票哥",@"十二鹿晗", @"辛德勒名单", @"蝙蝠侠前传2", @"指环王: 网站就来", @"飞跃疯人院", @"深圳天分:委员提案了", @"你妈妈给你", @"我是一再爱的两个人", @"我们约会吧", @"为什么我还是泽火革", @"为爱期望", @"金金金王", @"为爱疯狂", nil];
    self.controllerList = array;
    // 数据
    // Navigator Controller 视图控制器[表格视图控制器]
    detailLabel = [UILabel alloc];
}
- (void)viewUnLoad
{
    self.controllerList = nil; // 释放内存
    self.message = nil;
    self.detailLabel = nil;
    self.childController = nil;
}
// 视图出现处理[每次视图加载时都会执行]
-(void) viewWillAppear:(BOOL) animated{
    detailLabel.text = message; // 刷新信息Message
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.返回目录的条数[多少个目录Sections]
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.返回目录中的行数 sub view controller
    return [controllerList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell"; // Cell格子索引
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; // 取得当前的索引Cell格子:如果有
    if(cell == nil){
        // 创建Cell格子
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ];
    }
    // 修改Cell格子的内容
    NSUInteger row = [indexPath row];// 取得当前Cell的行row数
    //UITableViewController *controller = [controllerList objectAtIndex:row]; // 在Array数据数组中取得该Row的数据Control对
    NSString *title = [controllerList objectAtIndex:row];
    cell.textLabel.text = title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 设置右边的图标
    
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller. 点击选中事件
    NSUInteger row = [indexPath row];
    NSString *title = [self.controllerList objectAtIndex:row];
    MovieDetailViewController *detail = [MovieDetailViewController alloc]; // 创建行页面
    detail.movieTitle = title;// 传入参数到另一个对象
    NSLog(@"Title:%@" ,title);
    [self.navigationController pushViewController:detail animated:YES]; // Push一个Controller到导航控制器
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//- (void)tableView:(UITableView *)tableView
//accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
//    if (childController == nil) {
//        childController = [[MovieDetailViewController alloc]
//                           initWithNibName:@"MovieDetailViewController" bundle:nil];
//    }
//    NSUInteger row = [indexPath row];
//    NSString *selectedMovie = [movieList objectAtIndex:row];
//    NSString *detailMessage = [[NSString alloc]
//                               initWithFormat:@"你选择了电影：%@.", selectedMovie];
//    childController.message = detailMessage;
//    childController.title = selectedMovie;
//    [self.navigationController pushViewController:childController animated:YES];
//}
@end
