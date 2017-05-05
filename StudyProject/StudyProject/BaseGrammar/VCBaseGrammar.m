//
//  VCBaseGrammar.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-19.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "VCBaseGrammar.h"
#import "NSString_ExtensionNSString.h" // 引入扩展类头
#import "MemoryRetainCount.h"
#import "SelectorDelegate.h"
@interface VCBaseGrammar ()
@end
@implementation VCBaseGrammar
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
	// NSString 扩展方法
//    [XTMyLog info:@"%@", [@"Xiaotian" toString]];
    [[MemoryRetainCount alloc] init];
    [[[SelectorDelegate alloc]init] method];
//    [XTMyLog info:@"view Did Load."];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
