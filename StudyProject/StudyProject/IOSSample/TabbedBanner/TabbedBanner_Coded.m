//
//  TabbedBanner_Coded.m
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "TabbedBanner_Coded.h"
#import "TabbedBanner_CodedViewController.h"
#import "TabbedBannerTextViewController.h"

@interface TabbedBanner_Coded ()

@end

@implementation TabbedBanner_Coded

-(instancetype)init{
    
    NSData *ipsumData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ipsums" withExtension:@"plist"] options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *ipsums = [NSPropertyListSerialization propertyListWithData:ipsumData options:NSPropertyListImmutable format:nil error:nil];
    
    TabbedBannerTextViewController *originalIpsumViewController = [[TabbedBannerTextViewController alloc] init];
    originalIpsumViewController.title = NSLocalizedString(@"Original", @"Original");
    originalIpsumViewController.text = ipsums[@"Original"];
    
    TabbedBannerTextViewController *meatyIpsumViewController = [[TabbedBannerTextViewController alloc] init];
    meatyIpsumViewController.title = NSLocalizedString(@"Meaty", @"Meaty");
    meatyIpsumViewController.text = ipsums[@"Meaty"];
    
    TabbedBannerTextViewController *veganIpsumViewController = [[TabbedBannerTextViewController alloc] init];
    veganIpsumViewController.title = NSLocalizedString(@"Vegan", @"Vegan");
    veganIpsumViewController.text = ipsums[@"Vegan"];
    
    self = [super init];
    self.viewControllers = @[
                            [[TabbedBanner_CodedViewController alloc] initWithContentViewController:originalIpsumViewController],
                            [[TabbedBanner_CodedViewController alloc] initWithContentViewController:meatyIpsumViewController],
                            [[TabbedBanner_CodedViewController alloc] initWithContentViewController:veganIpsumViewController],
                            ];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
