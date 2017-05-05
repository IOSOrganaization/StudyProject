//
//  UseTableView.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>
// 实现UITableViewDataSource,UITableViewDelegate:接口

// 如果是继承的UITableViewController则不需要实现这两个接口
@interface UseTableView : UIViewController <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic, retain) NSArray* dataList;
@property(nonatomic, retain) UITableView *tableView;

@end
