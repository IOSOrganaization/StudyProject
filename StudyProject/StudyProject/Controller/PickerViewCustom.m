//
//  PickerViewCustom.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import "PickerViewCustom.h"
@interface PickerViewCustom ()
@end
@implementation PickerViewCustom
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
}
// 用户自定义的Picker View 视图组件的实现方法[可选]
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    return [UIView alloc];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    // 配置Picker View的宽度
    return 0.0f;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    // 配置Picker View的高度
    return 0.0f;
}
// 必须实现的方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2; // 选项Picker View 的视图个数
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
