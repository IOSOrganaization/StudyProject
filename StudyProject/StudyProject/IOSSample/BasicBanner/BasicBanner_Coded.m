//
//  BasicBanner_Coded.m
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "BasicBanner_Coded.h"

@interface BasicBanner_Coded ()

@end

@implementation BasicBanner_Coded

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    NSData *ipsumData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ipsums" withExtension:@"plist"] options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *ipsums = [NSPropertyListSerialization propertyListWithData:ipsumData options:NSPropertyListImmutable format:nil error:nil];
    
    self.title = NSLocalizedString(@"Original", @"Original");
    self.text = ipsums[@"Original"];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
