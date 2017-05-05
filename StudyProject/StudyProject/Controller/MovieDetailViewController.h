//
//  MovieDetailViewController.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-31.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController{
    // 成员变量
    UIAlertView *_alertView;
}

// 类变量
@property(retain, nonatomic) NSString* movieTitle;
@property(retain, nonatomic) UIAlertView *alertView;
@end
