/*
     File: RootViewController.m
 Abstract: Table view controller that displays events occuring within the next 24 hours. Prompts a user
 for access to their Calendar, then updates its UI according to their response.
 
  Version: 1.1
 
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
 
 Copyright (C) 2013 Apple Inc. All Rights Reserved.
 
 */

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "SimpleEKDemoRootViewController.h"

@interface SimpleEKDemoRootViewController () <EKEventEditViewDelegate>
// EKEventStore instance associated with the current Calendar application
@property (nonatomic, strong) EKEventStore *eventStore;

// Default calendar associated with the above event store
@property (nonatomic, strong) EKCalendar *defaultCalendar;

// Array of all events happening within the next 24 hours
@property (nonatomic, strong) NSMutableArray *eventsList;

// Used to add events to Calendar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@end

@implementation SimpleEKDemoRootViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad{
    [XTFMylog info:@"页面加载中 viewDidLoad"];
    [super viewDidLoad];
	// Initialize the event store  
	self.eventStore = [[EKEventStore alloc] init];
    // Initialize the events list
	self.eventsList = [[NSMutableArray alloc] initWithCapacity:0];
    // The Add button is initially disabled
    self.addButton.enabled = NO;
}


-(void)viewDidAppear:(BOOL)animated{
    [XTFMylog info:@"页面显示中 viewDidLoad:"];
    [super viewDidAppear:animated];
    // Check whether we are authorized to access Calendar
    [self checkEventStoreAccessForCalendar];
}


// This method is called when the user selects an event in the table view. It configures the destination
// event view controller with this event.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [XTFMylog info:@"故事版下一页面跳转中(传递参数) prepareForSegue:sender:"];
    if ([[segue identifier] isEqualToString:@"showEventViewController"]){
        // Configure the destination event view controller
        EKEventViewController* eventViewController = (EKEventViewController *)[segue destinationViewController];
        // Fetch the index path associated with the selected event
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // Set the view controller to display the selected event
        eventViewController.event = [self.eventsList objectAtIndex:indexPath.row];
        
        // Allow event editing
        eventViewController.allowsEditing = YES;
    }
}

#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    [XTFMylog info:@"表格视图控制器委托接口协议 获取对应章Section里面的节数 tableView:numberOfRowsInSection:"];
	return self.eventsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [XTFMylog info:@"表格视图控制器委托接口协议 获取每一节的视图Cell tableView:cellForRowAtIndexPath:"];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventCell" forIndexPath:indexPath];
    // Get the event at the row selected and display its title
    cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
    return cell;
}

#pragma mark Access Calendar

// Check the authorization status of our application for Calendar 
-(void)checkEventStoreAccessForCalendar{
    [XTFMylog info:@"检测日历事件存储[EventStore]授权状态 checkEventStoreAccessForCalendar"];
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];    
 
    switch (status){
        // Update our UI if the user has granted access to their Calendar
        case EKAuthorizationStatusAuthorized: [self accessGrantedForCalendar];
            break;
        // Prompt the user for access to Calendar if there is no definitive answer
        case EKAuthorizationStatusNotDetermined: [self requestCalendarAccess];
            break;
        // Display a message if the user has denied or restricted access to Calendar
        case EKAuthorizationStatusDenied:
        case EKAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning"
                                                            message:@"Permission was not granted for Calendar"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}


// Prompt the user for access to their Calendar
-(void)requestCalendarAccess{
    [XTFMylog info:@"请求获取日历读存权限 requestCalendarAccess"];
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
         if (granted){
             SimpleEKDemoRootViewController * __weak weakSelf = self;
             // Let's ensure that our code will be executed from the main queue
             dispatch_async(dispatch_get_main_queue(), ^{
             // The user has granted access to their Calendar; let's populate our UI with all events occuring in the next 24 hours.
                 [weakSelf accessGrantedForCalendar];
             });
         }
     }];
}


// This method is called when the user has granted permission to Calendar
-(void)accessGrantedForCalendar{
    [XTFMylog info:@"用户同意日历读写权限回调 accessGrantedForCalendar"];
    // Let's get the default calendar associated with our event store
    self.defaultCalendar = self.eventStore.defaultCalendarForNewEvents;
    // Enable the Add button  
    self.addButton.enabled = YES;
    // Fetch all events happening in the next 24 hours and put them into eventsList
    self.eventsList = [self fetchEvents];
    // Update the UI with the above events
    [self.tableView reloadData];
}

#pragma mark Fetch events 获取保存的事件

// Fetch all events happening in the next 24 hours 
- (NSMutableArray *)fetchEvents{
    [XTFMylog info:@"加载日历事件 fetchEvents"];
    NSDate *startDate = [NSDate date]; /*日期*/
    //Create the end date components
    NSDateComponents *tomorrowDateComponents = [[NSDateComponents alloc] init]; /*日期组件*/
    tomorrowDateComponents.day = 1;/*day加1*/
    NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingComponents:tomorrowDateComponents
                                                                    toDate:startDate
                                                                   options:0]; /*日历组件:日期操作[开始日期+1天]*/
	// We will only search the default calendar for our events
	NSArray *calendarArray = [NSArray arrayWithObject:self.defaultCalendar];
    // 存储查询管理器[断言查询器]今日到明日
    // Create the predicate
	NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:startDate
                                                                      endDate:endDate
                                                                    calendars:calendarArray];
	// 根据查询管理器匹配查询数据 Fetch all events that match the predicate
	NSMutableArray *events = [NSMutableArray arrayWithArray:[self.eventStore eventsMatchingPredicate:predicate]];
	return events;
}

#pragma mark Add a new event
// 打开EventKitUI[系统事件组件UI]页面控制器,输入需要记录的事件

// Display an event edit view controller when the user taps the "+" button.
// A new event is added to Calendar when the user taps the "Done" button in the above view controller.
- (IBAction)addEvent:(id)sender{
    [XTFMylog info:@"点击添加按钮 addEvent:"];
	// Create an instance of EKEventEditViewController 
	EKEventEditViewController *addController = [[EKEventEditViewController alloc] init];
	
	// Set addController's event store to the current event store
	addController.eventStore = self.eventStore;
    addController.editViewDelegate = self;
    [self presentViewController:addController animated:YES completion:nil];
}

#pragma mark EKEventEditViewDelegate 绑定[事件存储]委托接口协议

// Overriding EKEventEditViewDelegate method to update event store according to user actions.
- (void)eventEditViewController:(EKEventEditViewController *)controller 
		  didCompleteWithAction:(EKEventEditViewAction)action{
    [XTFMylog info:@"添加事件[事件页面控制器]添加成功回调 eventEditViewController:didCompleteWithAction:"];
    SimpleEKDemoRootViewController * __weak weakSelf = self;
	// Dismiss the modal view controller
    [self dismissViewControllerAnimated:YES completion:^{
         if (action != EKEventEditViewActionCanceled){
             dispatch_async(dispatch_get_main_queue(), ^{
                 // Re-fetch all events happening in the next 24 hours
                 weakSelf.eventsList = [self fetchEvents];
                 // Update the UI with the above events
                 [weakSelf.tableView reloadData];
             });
         }
     }];
}


// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
- (EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller{
    [XTFMylog info:@"有新事件添加到日历时,触发日历新事件监听器 eventEditViewControllerDefaultCalendarForNewEvents:"];
	return self.defaultCalendar;
}

@end