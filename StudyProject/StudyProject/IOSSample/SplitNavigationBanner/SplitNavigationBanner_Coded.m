//
//  SplitNavigationBanner_Coded.m
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import <iAd/iAd.h>
#import "SplitNavigationBanner_Coded.h"
#import "SplitNavigationBannerMaster.h"
#import "SplitNavigationBannerTextViewController.h"

@interface SplitNavigationBanner_Coded ()

@end

@implementation SplitNavigationBanner_Coded{
    UINavigationController *_navigationController;
    UISplitViewController *_splitViewController;
    ADBannerView *_bannerView;
    UIViewController *_contentController;
}

- (instancetype)init{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // On iPhone we use a UINavigationController as our primary user interface.
        // In that configuration, the master view controller won't have a detail view controller.
        SplitNavigationBannerMaster *masterViewController = [[SplitNavigationBannerMaster alloc] initWithStyle:UITableViewStyleGrouped];
        _navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
    } else {
        // On iPad we use a UISplitViewController as our primary user interface.
        // In this configuration, the master view controller has a detail view controller that it will update as the selection changes.
        SplitNavigationBannerMaster *masterViewController = [[SplitNavigationBannerMaster alloc] initWithStyle:UITableViewStylePlain];
        SplitNavigationBannerTextViewController *detailViewController = [[SplitNavigationBannerTextViewController alloc] init];
        masterViewController.detailViewController = detailViewController;
        
        _splitViewController = [[UISplitViewController alloc] init];
        _splitViewController.viewControllers = @[
                                                 [[UINavigationController alloc] initWithRootViewController:masterViewController],
                                                 [[UINavigationController alloc] initWithRootViewController:detailViewController]
                                                 ];
        _splitViewController.delegate = self;
    }
    self = [super init];
    if (self != nil) {
        // On iOS 6 ADBannerView introduces a new initializer, use it when available.
        if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)]) {
            _bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        } else {
            _bannerView = [[ADBannerView alloc] init];
        }
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
               _contentController = _navigationController;
        } else {
               _contentController = _splitViewController;
        }
        _bannerView.delegate = self;
    }

    return self;
}

- (void)loadView
{
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [contentView addSubview:_bannerView];
    
    // Setup containment of the _contentController.
    [self addChildViewController:_contentController];
    [contentView addSubview:_contentController.view];
    [_contentController didMoveToParentViewController:self];
    
    self.view = contentView;
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [_contentController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}
#endif

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [_contentController preferredInterfaceOrientationForPresentation];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [_contentController supportedInterfaceOrientations];
}

- (void)viewDidLayoutSubviews
{
    // This method will be called whenever we receive a delegate callback
    // from the banner view.
    // (See the comments in -bannerViewDidLoadAd: and -bannerView:didFailToReceiveAdWithError:)
    
    CGRect contentFrame = self.view.bounds, bannerFrame = CGRectZero;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    // If configured to support iOS <6.0, then we need to set the currentContentSizeIdentifier in order to resize the banner properly.
    // This continues to work on iOS 6.0, so we won't need to do anything further to resize the banner.
    if (contentFrame.size.width < contentFrame.size.height) {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    } else {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    bannerFrame = _bannerView.frame;
#else
    // If configured to support iOS >= 6.0 only, then we want to avoid currentContentSizeIdentifier as it is deprecated.
    // Fortunately all we need to do is ask the banner for a size that fits into the layout area we are using.
    // At this point in this method contentFrame=self.view.bounds, so we'll use that size for the layout.
    bannerFrame.size = [_bannerView sizeThatFits:contentFrame.size];
#endif
    
    // Check if the banner has an ad loaded and ready for display.  Move the banner off
    // screen if it does not have an ad.
    if (_bannerView.bannerLoaded) {
        contentFrame.size.height -= bannerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
    } else {
        bannerFrame.origin.y = contentFrame.size.height;
    }
    _contentController.view.frame = contentFrame;
    _bannerView.frame = bannerFrame;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView animateWithDuration:0.25 animations:^{
        // -viewDidLayoutSubviews will handle positioning the banner such that it is either visible
        // or hidden depending upon whether its bannerLoaded property is YES or NO (It will be
        // YES if -bannerViewDidLoadAd: was last called).  We just need our view
        // to (re)lay itself out so -viewDidLayoutSubviews will be called.
        // You must not call [self.view layoutSubviews] directly.  However, you can flag the view
        // as requiring layout...
        [self.view setNeedsLayout];
        // ...then ask it to lay itself out immediately if it is flagged as requiring layout...
        [self.view layoutIfNeeded];
        // ...which has the same effect.
    }];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView animateWithDuration:0.25 animations:^{
        // -viewDidLayoutSubviews will handle positioning the banner such that it is either visible
        // or hidden depending upon whether its bannerLoaded property is YES or NO (It will be
        // NO if -bannerView:didFailToReceiveAdWithError: was last called).  We just need our view
        // to (re)lay itself out so -viewDidLayoutSubviews will be called.
        // You must not call [self.view layoutSubviews] directly.  However, you can flag the view
        // as requiring layout...
        [self.view setNeedsLayout];
        // ...then ask it to lay itself out immediately if it is flagged as requiring layout...
        [self.view layoutIfNeeded];
        // ...which has the same effect.
    }];
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BannerViewActionWillBegin object:self];
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BannerViewActionDidFinish object:self];
}

- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
}

@end
