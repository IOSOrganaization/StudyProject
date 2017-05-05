//
//  TabbedBannerCodedViewController.h
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

extern NSString * const BannerViewActionWillBegin;
extern NSString * const BannerViewActionDidFinish;

@interface TabbedBanner_CodedViewController : UIViewController

- (instancetype)initWithContentViewController:(UIViewController *)contentController;

@end
