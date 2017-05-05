//
//  SplitNavigationBannerMaster.m
//  StudyProject
//
//  Created by XiaoTian on 1/31/15.
//  Copyright (c) 2015 XiaoTian. All rights reserved.
//

#import "SplitNavigationBannerMaster.h"
#import "SplitNavigationBannerTextViewController.h"

@interface SplitNavigationBannerMaster ()

@end

@implementation SplitNavigationBannerMaster{
    NSDictionary *_ipsums;
    NSArray *_ipsumNames;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = NSLocalizedString(@"Ipsums", @"Ipsums");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            // On iPad only, don't clear the selection (we are displaying in a split view on iPad).
            self.clearsSelectionOnViewWillAppear = NO;
        }
        
        NSData *tmp = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ipsums" withExtension:@"plist"] options:NSDataReadingMappedIfSafe error:nil];
        _ipsums = [NSPropertyListSerialization propertyListWithData:tmp options:NSPropertyListImmutable format:nil error:nil];
        _ipsumNames = [[_ipsums allKeys] sortedArrayUsingSelector:@selector(compare:)];
    }
    return self;
}

- (void)configureDetailItemForRow:(NSUInteger)row
{
    NSString *item = _ipsumNames[row];
    NSString *text = _ipsums[item];
    NSString *title = NSLocalizedString(item, @"Original-Meaty-Vegan");
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // On iPhone we need to push on our navigation stack.
        SplitNavigationBannerTextViewController *textViewController = [[SplitNavigationBannerTextViewController alloc] init];
        textViewController.text = text;
        textViewController.title = title;
        [self.navigationController pushViewController:textViewController animated:YES];
    } else {
        // On iPad we need to just configure our detail view.
        self.detailViewController.text = text;
        self.detailViewController.title = title;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        [self configureDetailItemForRow:0];
    }
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
#endif

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_ipsums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text = _ipsumNames[indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // Disclsure indicators on iPhone only.
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureDetailItemForRow:indexPath.row];
}

@end
