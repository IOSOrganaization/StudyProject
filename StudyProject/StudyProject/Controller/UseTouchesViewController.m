//
//  UseTouchesViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-8.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "UseTouchesViewController.h"
@interface UseTouchesViewController ()
@end
@implementation UseTouchesViewController
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
	// Do any additional setup after loading the view.
    labelXAxis = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 180, 32)];
    labelYAxis = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 180, 32)];
    labelTabs = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 180, 32)];
    touchview = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 100)];
    [touchview setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:labelXAxis];
    [self.view addSubview:labelYAxis];
    [self.view addSubview:labelTabs];
    [self.view addSubview:touchview];
    
    // 设置点击,拖拉手势
    [self createDoubleTapRecognizer];
    [self createSingleTapRecognizer];
    [self createPinchRecognizer];
    [self createSwipeRecognizers];
}
#pragma mark - UIGestureRecognizerDelegate Create Gesture Recognizers
-(void) createSingleTapRecognizer{
    // 单点击Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleSingleTapEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate:self]; // 委托事件
}
-(void) createDoubleTapRecognizer{
    // 双击Tap
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];
    [recognizer setNumberOfTapsRequired:2]; // 设置点击Tap的次数
}
-(void) createPinchRecognizer{
    //
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlerPinchEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate: self];
}
-(void) createSwipeRecognizers{
    // 滑动记录侦听器
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionLeft]; // 左划
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionRight]; // 右划
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionUp]; // 上划
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionDown]; // 下划
}
-(void)createSwipeRecognizer:(UISwipeGestureRecognizerDirection) direction{
    // 方向滑动侦听记录器
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDirection:direction]; // 设置滑动方向
}
#pragma mark Tap Event Handlers
-(void)handleSingleTapEvent:(UITapGestureRecognizer *) recognizer{
    [self updateDisplayWithPhase:@"UITapGestureTecognizer" tapCount:1 touchCount:1];
    [self moveImage:recognizer]; // 移动View,实现效果
}
-(void)handleDoubleTapEvent:(UITapGestureRecognizer *) recognizer{
    [self updateDisplayWithPhase:@"UITapGestureTecognizer" tapCount:2 touchCount:1];
    [self moveImage:recognizer]; // 移动View,实现效果
}
-(void)handlerPinchEvent:(UIPinchGestureRecognizer *) recognizer{
    [self updateDisplayWithPhase:@"UITapGestureTecognizer" tapCount:1 touchCount:2];
    CGFloat scale = [(UIPinchGestureRecognizer *) recognizer scale]; // 缩放比例
    if([recognizer state] == UIGestureRecognizerStateEnded){
        // 拖拉,缩放结束
        [UIView beginAnimations:nil context:nil];// 动态效果
        [UIView setAnimationDuration:0.10];
        [[self view] setTransform:CGAffineTransformIdentity];
        [UIView commitAnimations]; // 执行提交
    }else{
        // 正在拖拉
        [UIView beginAnimations:nil context:nil];// 动态效果
        [UIView setAnimationDuration:0.10];
        [[self view] setTransform:CGAffineTransformMakeScale(scale, scale)]; // 覆盖缩放
        [UIView commitAnimations]; // 执行提交
    }
}
-(void)handleSwipeEvent:(UISwipeGestureRecognizer *)recognizer{
    // 交互移动
    NSString *swipeDirection = nil;
    CGPoint location = [recognizer locationInView:[self view]]; // 取得在View 中的位置
    [touchview setCenter:location];
    if([recognizer direction] == UISwipeGestureRecognizerDirectionLeft){
        // 左拖动
        swipeDirection = @"UISwipeGestureRecognizerDirectionLeft";
        location.x -= 150.0;
    }else if([recognizer direction] == UISwipeGestureRecognizerDirectionRight){
        // 右拖动
        swipeDirection = @"UISwipeGestureRecognizerDirectionRight";
        location.x += 150.0;
    }else if([recognizer direction] == UISwipeGestureRecognizerDirectionUp){
        // 上拖动
        swipeDirection = @"UISwipeGestureRecognizerDirectionUp";
        location.y -= 150.0;
    }else if([recognizer direction] == UISwipeGestureRecognizerDirectionDown){
        // 下拖动
        swipeDirection = @"UISwipeGestureRecognizerDirectionDown";
        location.y += 150.0;
    }
    if(swipeDirection !=nil){
        [self updateDisplayWithPhase:swipeDirection tapCount:1 touchCount:1];
        [UIView beginAnimations:nil context:nil]; // 动态切换
        [UIView setAnimationDuration:0.50];
        [touchview setCenter:location];
        [UIView commitAnimations];
    }
}

#pragma mark view update
-(void) updateDisplayWithPhase:(NSString *) recognizer tapCount:(int)tapCount touchCount:(int) touchCount{
    [labelXAxis setText:recognizer];
    [labelYAxis setText:[NSString stringWithFormat:@"Touch Count: %d",touchCount]];
    [labelTabs setText:[NSString stringWithFormat:@"Tap count: %d",tapCount]];
}
// 移动图片
-(void)moveImage:(UITapGestureRecognizer *)recognizer{
    CGPoint location = [recognizer locationInView:[self view]]; // self view :: 整个视图View
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.50];
    [touchview setCenter:location];
    [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
