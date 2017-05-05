//
//  UseDataPickerViewController.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UseDataPicker : UIViewController

// 组件变量属性
@property(retain, nonatomic) UIDatePicker * datePicker;
@property(retain, nonatomic) UILabel * topLabel;
@property(retain, nonatomic) UILabel * bottomLabel;
@property(retain, nonatomic) NSDate * pickerDate;
// 事件
- (IBAction)onValueChanged:(id)sender;

@end
