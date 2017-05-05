/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  AAPLRootViewController implementation.
  
 */

#import "LookInsideRootViewController.h"
#import "AAPLPhotoCollectionViewCell.h"
#import "AAPLOverlayViewController.h"

#import "AAPLOverlayTransitioner.h"
#import "AAPLCoolTransitioner.h"

#define kNumberOfViews (37)
#define kViewsWide (5)
#define kViewMargin (2.0)
#define kCellReuseIdentifier @"CellReuseIdentifier"

@implementation LookInsideRootViewController

- (instancetype)init{
    [XTFMylog info:@"视图控制器初始化 -> init"];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];// 浮动集合布局
    self = [super initWithCollectionViewLayout:layout];// 由浮动布局初始化浮动布局控制器
    if (self){
        [self configureTitleBar];
    }
    return self;
}

- (void)viewDidLoad{
    [XTFMylog info:@"视图控制器页面初始化,页面加载中..."];
    // 注册复用Cell到浮动集合视图中
    [[self collectionView] registerClass:[AAPLPhotoCollectionViewCell class] forCellWithReuseIdentifier:kCellReuseIdentifier];
    [[self collectionView] setBackgroundColor:nil];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)[self collectionViewLayout];
    
    [layout setMinimumInteritemSpacing:kViewMargin];// 内部项间隔,列间隔
    [layout setMinimumLineSpacing:kViewMargin];// 行间隔
    
    [self viewWillTransitionToSize:[[self view] bounds].size withTransitionCoordinator:nil];
    
    [self.navigationController setHidesBarsOnTap:NO];
    [self configureTitleBar];
}

#pragma mark - UICollectionViewFlowLayout Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    [XTFMylog info:@"获取浮动集合容器的分组中的单元Cell数"];
    return kNumberOfViews;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    [XTFMylog info:@"根据IndexPath获取可复用的单元Cell"];
    AAPLPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    NSString *photoName = [@([indexPath item]) stringValue];
    UIImage *photo = [UIImage imageNamed:photoName];
    
    [cell setImage:photo];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [XTFMylog info:@"选择单元格Cell IndexPath=%@", indexPath];
    
    AAPLOverlayViewController *overlay = [[AAPLOverlayViewController alloc] init];
    
    // Change our transitioning delegate based on whether or not the presentation should be awesome

    if([self presentationShouldBeAwesome]){
        // 渐变Cool弹出页面
        _transitioningDelegate = [[AAPLCoolTransitioningDelegate alloc] init];
    } else {
        // 覆盖模式弹出页面
        _transitioningDelegate = [[AAPLOverlayTransitioningDelegate alloc] init];
    }

    [overlay setTransitioningDelegate:[self transitioningDelegate]];

    AAPLPhotoCollectionViewCell *selectedCell = (AAPLPhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    [overlay setPhotoView:selectedCell];
    // 显示
    [self presentViewController:overlay animated:YES completion:NULL];
}

- (BOOL)presentationShouldBeAwesome{
    // 是否打开渐变并和的Cool弹出页面
    return [[self coolSwitch] isOn];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    CGFloat itemWidth = size.width / kViewsWide;
    itemWidth -= kViewMargin;
    
    // Base our item size off of our view size
    [(UICollectionViewFlowLayout *)[[self collectionView] collectionViewLayout] setItemSize:CGSizeMake(itemWidth, itemWidth)];
    [[self collectionViewLayout] invalidateLayout];// 刷新页面布局
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)configureTitleBar{
    [XTFMylog info:@"配置标题工具控制栏"];
    [self setTitle:NSLocalizedString(@"LookInside Photos", @"App Title")];
    [self setEdgesForExtendedLayout:UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight];
        
    _coolSwitch = [[UISwitch alloc] init];
    [[self coolSwitch] setOnTintColor:[UIColor purpleColor]];
    [[self coolSwitch] setTintColor:[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.2]];
    
    UIBarButtonItem *enablecoolBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self coolSwitch]];
    
    [[self navigationItem] setLeftBarButtonItems:[self.navigationItem.leftBarButtonItems arrayByAddingObject:enablecoolBarButtonItem]];
}

@end

