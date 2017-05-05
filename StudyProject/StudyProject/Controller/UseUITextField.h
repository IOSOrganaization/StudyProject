//
//  UseUITextField.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-28.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>

// 声明类,继承视图控制器
@interface UseUITextField : UIViewController <UITextFieldDelegate>{
    // 类私有变量
    UITextField * textField;
}
    // 类公有属性
    @property(nonatomic, retain) UITextField* textField ;
@end
