//
//  UseScrollView.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-5-30.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UseButton.h"
#import "UseImageView.h"
#import "UseTableView.h"

@interface UseScrollView : UIViewController <UIScrollViewDelegate>{
    UIScrollView *scrollView;
    UseButton * viewButton;
    UseImageView * viewImage;
    UseTableView * viewTable;
    UIImageView *view_a,*view_b;
}
@end
