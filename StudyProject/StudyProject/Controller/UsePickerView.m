//
//  UsePickerView.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-6.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UsePickerView.h"

@interface UsePickerView ()

@end

@implementation UsePickerView
// 合成property属性
@synthesize cities;
@synthesize mutableCities;
@synthesize cityAndSubjectPicker;

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
    // PickerView 滚动小视图
    
    cities = [[NSArray alloc] initWithObjects:@"New York",@"London",@"Paris",@"Chicago", nil]; // nil结尾
    mutableCities = [[NSMutableArray alloc] initWithCapacity:10]; // 根据容量初始化可变数组
    [mutableCities addObject:@"Museums"]; // 向可变数组添加元素
    [mutableCities addObject:@"Clubs"];
    [mutableCities addObject:@"Schools"];
    [mutableCities addObject:@"Hotels"];
    [mutableCities addObject:@"Airports"];
    
    cityAndSubjectPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    [cityAndSubjectPicker setDataSource:self]; // 绑定数据源
    [cityAndSubjectPicker setDelegate:self]; // 绑定委托事件
    [self.view addSubview:cityAndSubjectPicker];
    
    // 按钮-打开卡片滚动提示框
    UIButton * cityButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [cityButton setTitle:@"选中" forState:UIControlStateNormal];
    cityButton.frame = CGRectMake(10, 310, 70, 40);
    [cityButton addTarget:self action:@selector(showCityPicker:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cityButton];

}
// [Button]按钮方法
-(void) showCityPicker:(id) sender{
    int cityIndex = [cityAndSubjectPicker selectedRowInComponent:0]; // 选中第0个组件[City]
    int placeIndex = [cityAndSubjectPicker selectedRowInComponent:1];// 选中第一个组件[Mutil City]
    NSString * messageText = [[NSString alloc] initWithFormat:@"Are you looking for %@ in %@ ?",
        [mutableCities objectAtIndex:placeIndex],[cities objectAtIndex:cityIndex]];
    // 提示框Alert
    UIAlertView * message=[[UIAlertView alloc] initWithTitle:nil message:messageText delegate:nil cancelButtonTitle:@"YES" otherButtonTitles:nil,nil];
    [message show];
}
// Picker View 实现的方法

// 声明在PickerView中的组件个数[DataSource]
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// 声明每个组件中的rows行数[DataSource]
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        // 组件一[城市Picker卡片]
        return [cities count];
    // 组件二[可变对象picker卡片]
    return [mutableCities count];
}
// 组件View对象视图的标题 Title
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return [cities objectAtIndex:row];
    return [mutableCities objectAtIndex:row];
}
// 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    // 释放内存
    NSLog(@"dealloc");
}

@end
