
/*
     File: FirstDetailViewController.m
 Abstract: A simple view controller that adopts the SubstitutableDetailViewController protocol defined by DetailViewManager.
 It's responsible for adding and removing the popover button in response to rotation. This view controller uses a toolbar.
 
  Version: 1.2
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */

#import "FirstDetailViewController.h"

@implementation FirstDetailViewController

// -------------------------------------------------------------------------------
//	dealloc
// -------------------------------------------------------------------------------
- (void)dealloc {
    self.titleLabel = nil;
    self.navigationPaneBarButtonItem = nil;
}

#pragma mark SubstitutableDetailViewController

// -------------------------------------------------------------------------------
//	setNavigationPaneBarButtonItem:
//  Custom implementation for the navigationPaneBarButtonItem setter.
//  In addition to updating the _navigationPaneBarButtonItem ivar, it
//  reconfigures the toolbar to either show or hide the 
//  navigationPaneBarButtonItem.
// -------------------------------------------------------------------------------
- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem{
    [XTFMylog info:@"设置导航页面控制器的返回按钮"];
    if (navigationPaneBarButtonItem != _navigationPaneBarButtonItem) {
        if (navigationPaneBarButtonItem) {
            [self.navigationItem setLeftBarButtonItems:@[[self dismissUIBarButtonItem], navigationPaneBarButtonItem] animated:NO];
        } else {
            [self.navigationItem setLeftBarButtonItems:nil];
        }
        _navigationPaneBarButtonItem = navigationPaneBarButtonItem;
    }
}

#pragma mark View lifecycle

// -------------------------------------------------------------------------------
//	viewDidLoad:
// -------------------------------------------------------------------------------
- (void)viewDidLoad{
    [XTFMylog info:@"页面初始化 -> FirstDetailViewController"];
    // -setNavigationPaneBarButtonItem may have been invoked when before the
    // interface was loaded.  This will occur when setNavigationPaneBarButtonItem
    // is called as part of DetailViewManager preparing this view controller
    // for presentation as this is before the view is unarchived from the NIB.
    // When viewidLoad is invoked, the interface is loaded and hooked up.
    // Check if we are supposed to be displaying a navigationPaneBarButtonItem
    // and if so, add it to the toolbar.
    if (_navigationPaneBarButtonItem){
        [XTFMylog info:@"页面初始化加载中viewDidLoad设置左上角按钮"];
        [self.navigationItem setLeftBarButtonItems:@[[self dismissUIBarButtonItem], _navigationPaneBarButtonItem] animated:NO];
    }
}

// -------------------------------------------------------------------------------
//	viewWillAppear:
// -------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [XTFMylog info:@"页面显示时触发,设置页面的标题文本内容"];
    self.titleLabel.text = self.title;
}

// -------------------------------------------------------------------------------
//	viewDidUnload:
// -------------------------------------------------------------------------------
- (void)viewDidUnload {
	[super viewDidUnload];
    self.titleLabel = nil;
}

#pragma mark Rotation support

// -------------------------------------------------------------------------------
//	shouldAutorotateToInterfaceOrientation:
// -------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

-(UIBarButtonItem *) dismissUIBarButtonItem{
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)];
    return dismiss;
}

-(void) dismissViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
