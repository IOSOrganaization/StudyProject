//
//  UseTableView.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "UseTableView.h"
@interface UseTableView ()
@end

@implementation UseTableView
@synthesize tableView;

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
    // UITableView 组件使用
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // 数据集合
    NSArray *list = [NSArray arrayWithObjects:@"武汉",@"北京",@"上海",@"深圳",@"广州",@"重庆",@"香港",@"台湾",@"天津",@"武汉",@"北京",@"上海",@"深圳",@"广州",@"重庆",@"香港",@"台湾",@"天津",@"", nil];
    self.dataList = list; // 赋值
    UITableView *_tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    // 设置背景图[背景视图]
    _tableView.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"002"]];
    
    _tableView.dataSource = self; // 绑定数据源
    _tableView.delegate = self; // 绑定组件委托
    // 赋值全局引用
    self.tableView = _tableView;
    
    [self.view addSubview:self.tableView];
}
// UITableView [必须实现]实现方法
// section中的行数[目录中的行数]
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count; // 
}
// row行中的Cell表格Item[ITEM ViewControl]
- (UITableViewCell *)tableView:(UITableView *) intableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellWithIndentifier =  @"Cell"; // cell 格子标志符号
    //dequeueReusableCellWithIdentifier: 加入队列:通过索引标志重用Cell[如果TableView中有该索引,则重用对象]
    UITableViewCell *cell = [intableView dequeueReusableCellWithIdentifier:cellWithIndentifier]; // 取得重用Cell格子对象,如果已经有,否则返回nil空值
    if(cell == nil){
        // 新建格子,并分配内存[initWithStyle: Cell格子样式Item项样式,自定义/系统Item, reuseIdentifier:重用索引]
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellWithIndentifier];
    }
    NSUInteger row = [indexPath row]; // 取得Row行索引
    // - - - : 三个格子Cell, 一行
    // - - -
    //->
    // - : 一个格子Cell, 一行
    // -
    // -
    cell.textLabel.text = [self.dataList objectAtIndex:row]; // Item中的Text文本
    cell.imageView.image = [UIImage imageNamed:@"green.png"]; // Item中的小图片
    cell.detailTextLabel.text = @"详细信息"; // Item中的detail信息
    return cell;
}
// 选择实现的方法
// [UITableView]设置内容的缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [indexPath row];
}
// [UITableView]设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
// [UITableView]设置cell的分行背景色
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath row] % 2 == 0) {
        cell.backgroundColor = [UIColor clearColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
}
// [UITableView] row行点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取得选择的Row的Item'的文本
    NSString *msg = [[NSString alloc] initWithFormat:@"你选择的是:%@",[self.dataList objectAtIndex:[indexPath row]]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]; // otherButtonTitles:至少一个
//    [msg release];
    [alert show];
}
// 左拉动,弹出的删除按钮,的绑定事件
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行删除操作");
}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    // Default is 1 if not implemented
//    return 1;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    // fixed font style. use custom view (UILabel) if you want something different
//}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    
//}
//
//// Editing
//
//// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//// Moving/reordering
//
//// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//// Index
//
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
//}
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
//    // tell table which section corresponds to section title/index (e.g. "B",1))
//    
//}
//
//// Data manipulation - insert and delete support
//
//// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//// Data manipulation - reorder / moving support
//
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
