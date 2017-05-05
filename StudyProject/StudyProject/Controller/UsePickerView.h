//
//  UsePickerView.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-6.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>

// UIPickerView 滚动卡片视图: 实现数据源,委托协议接口
@interface UsePickerView : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>{
    
    
}
// 类层次的property属性
@property(strong,nonatomic) NSArray *cities; // 城市
@property(strong,nonatomic) NSMutableArray *mutableCities; // 可变的数组[比NSArray提供更多的方法]
// Picker View
@property(strong,nonatomic) UIPickerView *cityAndSubjectPicker;
@end
