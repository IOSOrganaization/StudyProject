//
//  UseImageView.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "UseImageView.h"
// 构造器
@interface UseImageView ()
@end
/*
 ImageView 组件的使用: 
 1. 支持的图片格式:png,jpeg,jpg,gif,bmp,tif,tiff
 */
@implementation UseImageView
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
    // 创建UIImage图像对象
    // 1.加载到缓存[直接加载,类方法]一次加载[如果在Retina屏幕显示,如果有@2文件,系统自动匹配同名加 @2 -> 003@2.png 后缀的文件]
    UIImage * uiImage = [UIImage imageNamed:@"003"]; // 加载到缓存中[反复引用时不加载]
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"003" ofType:@"png"];
     // 2.加载到缓存,通过Bundle上下文加载 pathForResource:文件名,ofType:文件类型[扩展名]
    UIImage * uiImage_ =[UIImage imageWithContentsOfFile:filePath];
    // 3. 加载到数据数组中[不缓存]
    NSData *data = [NSData dataWithContentsOfFile:filePath]; // 文件数据-> 数组数据
    UIImage * uiImage__ = [UIImage imageWithData:data];
    
    // 创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 120)];
    // 设置对象的图片
    [imageView setImage:uiImage__];
    
    [self.view addSubview:imageView];
//    [imageView release];
//    [uiImage release];
//    [uiImage_ release];
//    [uiImage__ release];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    /*NSData缓存网络图片数据到对象中,对象可以手动释放*/
    NSURL *imageURL = [NSURL URLWithString:@"http://images112.fotki.com/v189/photos/3/316714/1132803/image-vi.jpg"];// URL对象
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL ]; // 取得网络URL的数据
    UIImage * image = [[UIImage alloc] initWithData:imageData]; // 创建UIImage对象
    
    UIImageView *imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(160, 10, 120, 120)]; //图片视图
    [imageView_ setImage:image];
    [self.view addSubview:imageView_];
//    [imageView_ release];

    // animationImages 动态却换图片
    UIImageView *imageView_a = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120, 120, 120)]; //图片视图
    NSArray * frameArray = [[NSArray alloc] initWithObjects:
                            [UIImage imageNamed:@"images/002"], // 图片一 
                            [UIImage imageNamed:@"images/003" ], // 图片二
                            nil];
    imageView_a.animationImages = frameArray; // 设置animationImage的Image数组
    imageView_a.animationDuration = 0.5; // 动态持续时间
    imageView_a.animationRepeatCount = 1; // 循环次数
    imageView_a.userInteractionEnabled = NO; // 用户交换
    [imageView_a setHidden:NO];
    [self.view addSubview:imageView_a];
    [imageView_a startAnimating];// 启动动态
//    [imageView_a release];

    NSLog(@"Message");
}
- (void) handleTap:(UITapGestureRecognizer*)sender {
    CGPoint startLocation = [sender locationInView:self.view];
    NSLog(@"x:%f, Y:%f", startLocation.x, startLocation.y);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
