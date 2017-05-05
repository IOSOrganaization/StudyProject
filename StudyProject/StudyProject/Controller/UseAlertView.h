//
//  UseAlertView.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-5.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>

// 实现接口协议
@interface UseAlertView : UIViewController <UIActionSheetDelegate, UIAlertViewDelegate>
{
    UIAlertView *alertView;
    UIActionSheet *seetMessage;
}
@property(retain, nonatomic) UIAlertView *pAlertView;
@end
