//
//  FileIOController.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-7-18.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import "VCFileIO.h"
#import "ShareUserDefaults.h"
#import "FileWalker.h"
#import "FileBaseDirectories.h"
#import "Headers.h"

@interface VCFileIO ()
@end
@implementation VCFileIO
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// 对象类实例化
//    [[ShareUserDefaults alloc]init];
    [[[FileWalker alloc] init] enumeratorFiles];
    [[[FileBaseDirectories alloc] init]baseMethod];
    [XTFMylog info:@"View Did Load success!"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void) dealloc{
//    [super dealloc];
////    [MyLog info:@"dealloc 非ARC的释放内存了啦."];
//}
@end
