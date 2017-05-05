//
//  UseDataPickerViewController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-6-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "UseDataPicker.h"

@interface UseDataPicker ()

@end

@implementation UseDataPicker

@synthesize topLabel;
@synthesize bottomLabel;
@synthesize datePicker;
@synthesize pickerDate;


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
    // 时间日期对话框
    [super viewDidLoad];
    NSDate * dataA = [[NSDate alloc] init];
    NSDate * dataB = [[NSDate alloc] initWithTimeIntervalSinceNow:24*3600];// 调用方法创建对象
    NSDate * dataC = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:0]; // 1970-1-1 开始
    
    BOOL comparisonResult = [dataA isEqualToDate:dataB]; // 日期对象的比较
    NSDate * firstDate = [dataA earlierDate:dataB]; // 前日期
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    // 匹配格式
    // MMMM : 月的全称
    // d : 日
    // YYYY : 四位年
    // hh : 时
    // mm : 分
    // ss : 秒
    // a : AM
    // p : PM
    NSLog([formatter stringFromDate:dataB]);
    NSDate * dateD = [formatter dateFromString:@"2013年09月28日"];
    topLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 257, 280, 21)];
    topLabel.text = @"";
    bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 293, 280, 21)];
    bottomLabel.text = @"Please select a date.";
    
    [self.view addSubview:topLabel];
    [self.view addSubview:bottomLabel];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 250, 180)];
    datePicker.minimumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:-6*24*3600]; // 最小日期,6天前
    datePicker.maximumDate = [[NSDate alloc] initWithTimeIntervalSinceNow:6*24*3600]; // 6天后
    [datePicker addTarget:self action:@selector(onValueChanged:) forControlEvents:UIControlEventValueChanged]; // 绑定值改变触发事件
    [self.view addSubview:datePicker];
    //[datePicker release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 绑定的值改变时执行更新页面的数据显示组件
- (IBAction)onValueChanged:(id)sender{
    pickerDate = datePicker.date; // 取得PickView中的时间
    NSDateFormatter * dateFormater = [[NSDateFormatter alloc] init]; // 时间格式化对象
    [dateFormater setDateFormat:@"yyyy年M月d日 HH:mm:ss"];
    topLabel.text=[NSString stringWithFormat:@"Selected date :%@",[dateFormater stringFromDate:pickerDate]];
}
@end
