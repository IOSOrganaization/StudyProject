//
//  gtrAppDelegate.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-27.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "AppDelegate.h"
#import "StudyProject-Swift.h"

// Application 委托对象,程序根
@implementation AppDelegate

// window的头/实现合成
@synthesize window = _window;
// Navigator Control 导航控制器的合成
@synthesize navController;

// 预处理命令
#pragma mark-
// 页面资源初始化[默认不配置初始化时,系统从Info.plist中读取页面初始化配置]
// 完成执行带参数的页面初始化:nib
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//    // Override point for customization after application launch.
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        self.viewController = [[[ViewController alloc] initWithNibName:@"XIBUseStartViewController" bundle:nil] autorelease];
//    } else {
//        self.viewController = [[[ViewController alloc] initWithNibName:@"XIBUseStartViewController" bundle:nil] autorelease];
//    }
//    self.window.backgroundColor = [[UIColor alloc]initWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
//    // 加载第一个ViewController页面
//    self.window.rootViewController = [[UseTouchesViewController alloc]initWithNibName:nil bundle:nil];
//    [self.window makeKeyAndVisible];
//    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);//
//    return YES;
//}

// Navigator Control 导航控制器:UIWindow初始化
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    self.window = [[UIWindow alloc] initWithFrame : [[UIScreen mainScreen] bounds]]; // 实例化窗口
//    // 执行程序的初始化页面
//   UIViewController *root = [[UseNavigatorController alloc] initWithStyle : UITableViewStylePlain]; // Plain表格
//    // 加载自定义表格到系统引用表格中
//    self.navController = [[UINavigationController alloc] initWithRootViewController : root]; // 初始化头声明变量控制器
//    // 设置表格控制器的view视图到页面视图中
//    [self.window addSubview : navController.view];// 添加控制器的view视图到程序窗口页面
//    self.window.backgroundColor = [UIColor whiteColor]; // 设置窗口背景色
//    [self.window makeKeyAndVisible]; // 显示UiWindow
//    return YES;
//}

// Navigator Control 导航控制器:UIWindow初始化
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; // 实例化窗口
//    // 创建rootViewControl
//    self.window.rootViewController = [[ViewAutoResizing alloc] init];
//    self.window.backgroundColor = [UIColor whiteColor]; // 设置窗口背景色
//    [self.window makeKeyAndVisible]; // 显示UiWindow
//    return YES;
//}

// 由配置的storyboard初始化
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    // 不设置self.window和self.window.rootViewController初始化属性
//    return YES;
//}

// StudyProject Stub View
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // 不设置self.window和self.window.rootViewController初始化属性
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewControllerWelcome *viewControllerWelcome = [[ViewControllerWelcome alloc] init];/*欢迎使用页*/
    // 添加Detail到导航控制容器[视图容器+顶部导航栏(Stack栈叠加模式)]
    UINavigationController *detailViewController = [[UINavigationController alloc] initWithRootViewController: viewControllerWelcome];
    TableViewControllerNavigation *mainTableView = [[TableViewControllerNavigation alloc] initWithStyle: UITableViewStylePlain];/*导航页*/
    // 添加Master到导航控制容器
    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController: mainTableView];
    // 设置页面控制器属性
    [mainTableView setTitle:NSLocalizedString(@"appName", nil)];
    [viewControllerWelcome setTitle:NSLocalizedString(@"appName", nil)];
    // SplitViewController
    UISplitViewController *splitController = [[UISplitViewController alloc] init];
    // 设置Split内容控制器[必须是两个,第一个Master,第二个Detail]
    [splitController setViewControllers: [NSArray arrayWithObjects: masterNavigationController, detailViewController, nil]];
    [splitController setPresentsWithGesture: YES]; // 设置通过手势右滑可以展开主页[默认YES]
    [splitController setDelegate: viewControllerWelcome]; // 委托Split控制器[UISplitViewControllerDelegate 当横屏时触发]
    /******************************** AppDelegate 全局属性配置 ********************************/
    // 统一设置全局导航栏属性
    NSShadow *shadow = [[NSShadow alloc] init];/*标题阴影*/
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    UIColor *color = [UIColor blackColor]; /*文本颜色*/
    UIFont *font = [UIFont fontWithName:nil size:16.0];/*文本字体*/
    // 设置所有导航栏[UINavigationBar]背景
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.9]];
    // 设置静态实体属性
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName, shadow, NSShadowAttributeName, font, NSFontAttributeName, nil]];
    //
    // 优先显示所有控制器页面[如果可以(Ipad上),则同时显示: master+detail]
    [splitController setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
    [splitController setDelegate: self];
    //
    self.window.rootViewController = splitController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - UISplitViewControllerDelegate
- (UISplitViewControllerDisplayMode)targetDisplayModeForActionInSplitViewController:(UISplitViewController *)splitViewController {
    [XTFMylog info:@"UISplitViewControllerDelegate@targetDisplayModeForActionInSplitViewController:splitViewController:"];
    return UISplitViewControllerDisplayModeAllVisible;
}

#pragma mark AppDelegate Protocol
- (void)applicationWillResignActive:(UIApplication *)application
{
    [XTFMylog info:@"AppDelegate@applicationWillResignActive:application:"];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
     [XTFMylog info:@"AppDelegate@applicationDidEnterBackground:"];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [XTFMylog info:@"AppDelegate@applicationWillEnterForeground:"];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [XTFMylog info:@"AppDelegate@applicationDidBecomeActive:"];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // Swift 语法入口
    SwiftBaseGrammar *baseGrammar = [[SwiftBaseGrammar alloc] init];
    [baseGrammar baseGrammar]; // 初始方法
    //
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [XTFMylog info:@"AppDelegate@applicationWillTerminate:"];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

void UncaughtExceptionHandler_(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSString *url = [NSString stringWithFormat:@"=============异常崩溃报告=============\nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@",
                     name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"Exception.txt"];
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //除了可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器等
    //还可以选择调用发送邮件的的程序，发送信息到指定的邮件地址
    //或者调用某个处理程序来处理这个信息
    [XTFMylog info:@"**************************************************"];
    [XTFMylog info:url];
    [XTFMylog info:@"**************************************************"];
}

NSString *applicationDocumentsDirectory() {
    [XTFMylog info:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}
@end
