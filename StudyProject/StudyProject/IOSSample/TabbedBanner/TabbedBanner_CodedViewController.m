//
//  TabbedBannerCodedViewController.m
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "TabbedBanner_CodedViewController.h"

@interface BannerViewManagerCoded : NSObject <ADBannerViewDelegate>

@property (nonatomic, readonly) ADBannerView *bannerView;

+ (BannerViewManagerCoded *)sharedInstance;

- (void)addBannerViewController:(TabbedBanner_CodedViewController *)controller;
- (void)removeBannerViewController:(TabbedBanner_CodedViewController *)controller;

@end

@interface TabbedBanner_CodedViewController ()

// This method is used by BannerViewSingletonController to inform instances of BannerViewController that the banner has loaded/unloaded.
- (void)updateLayout;

@end

@implementation TabbedBanner_CodedViewController {
    UIViewController *_contentController;
}

- (instancetype)initWithContentViewController:(UIViewController *)contentController {
    // If contentController is nil, -loadView is going to throw an exception when it attempts to setup
    // containment of a nil view controller.  Instead, throw the exception here and make it obvious
    // what is wrong.
    NSAssert(contentController != nil, @"Attempting to initialize a BannerViewController with a nil contentController.");
    
    self = [super init];
    if (self != nil) {
        _contentController = contentController;
        [[BannerViewManagerCoded sharedInstance] addBannerViewController:self];
    }
    return self;
}

- (void)dealloc{
    [[BannerViewManagerCoded sharedInstance] removeBannerViewController:self];
}

- (void)loadView{
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Setup containment of the _contentController.
    [self addChildViewController:_contentController];
    [contentView addSubview:_contentController.view];
    [_contentController didMoveToParentViewController:self];
    
    self.view = contentView;
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return [_contentController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}
#endif

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [_contentController preferredInterfaceOrientationForPresentation];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [_contentController supportedInterfaceOrientations];
}

- (void)viewDidLayoutSubviews{
    CGRect contentFrame = self.view.bounds, bannerFrame = CGRectZero;
    ADBannerView *bannerView = [BannerViewManagerCoded sharedInstance].bannerView;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    NSString *contentSizeIdentifier;
    // If configured to support iOS <6.0, then we need to set the currentContentSizeIdentifier in order to resize the banner properly.
    // This continues to work on iOS 6.0, so we won't need to do anything further to resize the banner.
    if (contentFrame.size.width < contentFrame.size.height) {
        contentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    } else {
        contentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    bannerFrame.size = [ADBannerView sizeFromBannerContentSizeIdentifier:contentSizeIdentifier];
#else
    // If configured to support iOS >= 6.0 only, then we want to avoid currentContentSizeIdentifier as it is deprecated.
    // Fortunately all we need to do is ask the banner for a size that fits into the layout area we are using.
    // At this point in this method contentFrame=self.view.bounds, so we'll use that size for the layout.
    bannerFrame.size = [bannerView sizeThatFits:contentFrame.size];
#endif
    if (bannerView.bannerLoaded) {
        contentFrame.size.height -= bannerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
    } else {
        bannerFrame.origin.y = contentFrame.size.height;
    }
    _contentController.view.frame = contentFrame;
    // We only want to modify the banner view itself if this view controller is actually visible to the user.
    // This prevents us from modifying it while it is being displayed elsewhere.
    if (self.isViewLoaded && (self.view.window != nil)) {
        [self.view addSubview:bannerView];
        bannerView.frame = bannerFrame;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
        bannerView.currentContentSizeIdentifier = contentSizeIdentifier;
#endif
    }
}

- (void)updateLayout{
    [UIView animateWithDuration:0.25 animations:^{
        // -viewDidLayoutSubviews will handle positioning the banner such that it is either visible
        // or hidden depending upon whether its bannerLoaded property is YES or NO.  We just need our view
        // to (re)lay itself out so -viewDidLayoutSubviews will be called.
        // You must not call [self.view layoutSubviews] directly.  However, you can flag the view
        // as requiring layout...
        [self.view setNeedsLayout];
        // ...then ask it to lay itself out immediately if it is flagged as requiring layout...
        [self.view layoutIfNeeded];
        // ...which has the same effect.
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view addSubview:[BannerViewManagerCoded sharedInstance].bannerView];
}

- (NSString *)title{
    return _contentController.title;
}

@end

@implementation BannerViewManagerCoded {
    ADBannerView *_bannerView;
    NSMutableSet *_bannerViewControllers;
}

+ (BannerViewManagerCoded *)sharedInstance{
    static BannerViewManagerCoded *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[BannerViewManagerCoded alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    self = [super init];
    if (self != nil) {
        // On iOS 6 ADBannerView introduces a new initializer, use it when available.
        if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)]) {
            _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        } else {
            _bannerView = [[ADBannerView alloc] init];
        }
        _bannerView.delegate = self;
        _bannerViewControllers = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addBannerViewController:(TabbedBanner_CodedViewController *)controller{
    [_bannerViewControllers addObject:controller];
}

- (void)removeBannerViewController:(TabbedBanner_CodedViewController *)controller{
    [_bannerViewControllers removeObject:controller];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
    for (TabbedBanner_CodedViewController *bvc in _bannerViewControllers) {
        [bvc updateLayout];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    for (TabbedBanner_CodedViewController *bvc in _bannerViewControllers) {
        [bvc updateLayout];
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    [[NSNotificationCenter defaultCenter] postNotificationName:BannerViewActionWillBegin object:self];
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner{
    [[NSNotificationCenter defaultCenter] postNotificationName:BannerViewActionDidFinish object:self];
}

@end
