//
//  TableViewControllerNavigation.m
//  StudyProject
//
//  Created by XiaoTian on 12/28/14.
//  Copyright (c) 2014 XiaoTian. All rights reserved.
//
#import "TableViewControllerNavigation.h"
#import "StudyProject-swift.h"

NSMutableDictionary *dictionaryCountrollerPage(NSString *pageName,UIViewController *controller);


@interface TableViewControllerNavigation (){
    NSArray *mNSArray;
}
@end

@implementation TableViewControllerNavigation

// 重写: getter/setter
@synthesize arrayController = mNSArray;

- (instancetype)initWithStyle:(UITableViewStyle)style{
    self= [super initWithStyle:style];
    if(self){
        // 直接赋值地址,不调用getter/setter
        NSMutableArray * mNSMutableArray = [[NSMutableArray alloc] initWithCapacity:10];
        //
        [self loadCustomerExample:mNSMutableArray];
        [self loadIOSOfficeExample:mNSMutableArray];
        [self loadIOSOpenSourceExample:mNSMutableArray];
        // 排序
        mNSArray = [mNSMutableArray sortedArrayUsingComparator:^NSComparisonResult(PagerInfo *obj1, PagerInfo *obj2) {
            NSComparisonResult result = [obj1.pageLabel compare:obj2.pageLabel];
            if (result == NSOrderedSame) {
                result = [obj1.pageDescription compare:obj2.pageDescription];
            }
            return result;
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [XTFMylog info: self.navigationController];
    [self setTitle: NSLocalizedString(@"appName", nil)];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO; // 显示时清空选择状态

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem; // 右按钮
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - customer methods

#pragma mark - Table view data source methods
// 分组数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
// 每个组的数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [mNSArray count];
}

// 每个Cell单元的视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"REUSECELLIDENTIFIER"];
    if(nil == cell){
        [XTFMylog info:@"Create new table row view,row=%d", indexPath.row];
        cell = [[UITableViewCell alloc] init]; /**/
    }else{
        [XTFMylog info:@"Reuse a table row view,ow=%d", indexPath.row];
    }
    PagerInfo *page = (PagerInfo *)[mNSArray objectAtIndex: indexPath.row];
    [cell.textLabel setText:page.pageLabel];
    return cell;
}

// Cell 选中事件[默认该Cell的状态为选中]
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PagerInfo *pager = [mNSArray objectAtIndex: indexPath.row];
    [XTFMylog infoClassField:pager];
    if([pager isKindOfClass:[PagerInfoStoryboard class]]){
        PagerInfoStoryboard *pifs = (PagerInfoStoryboard*) pager;
        // 初始化Storyboard页面控制器
        UIStoryboard *uiStoryboard;
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
            NSString *phoneName = [NSString stringWithFormat:@"%@_iPhone",pifs.storyboardName];
            if(![XTFUtilFile existFile:[[NSBundle mainBundle] pathForResource:phoneName ofType:@"storyboardc"]]){
                phoneName = pifs.storyboardName;
            }
            uiStoryboard = [UIStoryboard storyboardWithName:phoneName bundle:nil];
        }else if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
            NSString *phoneName = [NSString stringWithFormat:@"%@_iPad",pifs.storyboardName];
            if(![XTFUtilFile existFile:[[NSBundle mainBundle] pathForResource:phoneName ofType:@"storyboardc"]]){
                phoneName = pifs.storyboardName;
            }
            uiStoryboard = [UIStoryboard storyboardWithName:phoneName bundle:nil];
        }
        UIViewController* uiViewController = [uiStoryboard instantiateInitialViewController];
        // [XTFMylog info:uiViewController];
        //uiViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        //uiViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        //[self.navigationController pushViewController:uiViewController animated:YES];
        [self presentViewController:uiViewController animated:YES completion:nil]; // present显示
        //[self navigationController].viewControllers = [[self navigationController].viewControllers arrayByAddingObject:uiViewController];
    } else {
        // 初始化到UINavigationController
        // 显示 ViewController
        UINavigationController *navigationController = [UINavigationController initWithLeftText:@"Back" leftIcon:nil title:pager.pageLabel rightText:@"Detail" rightIcon:nil target:pager.viewController];
        [navigationController setHidesBarsOnTap:YES];
        [self presentViewController:navigationController animated:YES completion:nil];
    }
    // 取消 Cell 选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 加载自定义其他例子
-(void)loadCustomerExample:(NSMutableArray *) mNSMutableArray{
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"ViewControllerWelcome" description:nil
                                                         class:[ViewControllerWelcome class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"CustomTabViewViewController" description:nil
                                                         class:[CustomTabViewViewController class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"FileIO-Operation" description:nil
                                                         class:[VCFileIO class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"PickerViewCustom" description:nil
                                                         class:[PickerViewCustom class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseAlertView" description:nil
                                                         class:[UseAlertView class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseButton" description:nil
                                                         class:[UseButton class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseDataPicker" description:nil
                                                         class:[UseDataPicker class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseImageView" description:nil
                                                         class:[UseImageView class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseNavigatorController" description:nil
                                                         class:[UseNavigatorController class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UsePickerView" description:nil
                                                         class:[UsePickerView class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseScrollView" description:nil
                                                         class:[UseScrollView class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseTableView" description:nil
                                                         class:[UseTableView class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseTouchesViewController" description:nil
                                                         class:[UseTouchesViewController class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"UseUITextField" description:nil
                                                         class:[UseUITextField class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"DataModleViewController" description:nil
                                                         class:[DataModleViewController class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"NetWorkBaseViewController" description:nil
                                                         class:[NetWorkBaseViewController class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"ViewAutoResizing" description:nil
                                                         class:[ViewAutoResizing class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"ViewPosition" description:nil
                                                         class:[ViewPosition class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"ViewProperties" description:nil
                                                         class:[ViewProperties class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"VCBaseGrammar" description:nil
                                                         class:[VCBaseGrammar class]]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"XIBUseStartViewController" description:nil
                                                              storyboard:@"XIBUseStartViewController"]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"A Swift Study Project" description:nil
                                                         class:[SwiftStudyProject class]]];
}

// 加载IOS官方列子
-(void)loadIOSOfficeExample:(NSMutableArray *) mNSMutableArray{
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-UICatalog" description:nil
                                                              storyboard:@"UICatalog"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ZoomingPDFViewer" description:nil
                                                              storyboard:@"ZoomingPDFViewer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ViewTransitions" description:nil
                                                              storyboard:@"ViewTransitions"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-URLCache" description:nil
                                                              storyboard:@"URLCache"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-UnwindSegue" description:nil
                                                              storyboard:@"UnwindSegue"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-UIImageEffects" description:nil
                                                              storyboard:@"UIImageEffects"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Touches" description:nil
                                                              storyboard:@"Touches"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TopSongs" description:nil
                                                              storyboard:@"TopSongs"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ToolbarSearch" description:nil
                                                              storyboard:@"ToolbarSearch"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ThreadedCoreData" description:nil
                                                              storyboard:@"ThreadedCoreData"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TheElements" description:nil
                                                              storyboard:@"TheElements"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Teslameter" description:nil
                                                              storyboard:@"Teslameter"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TaggedLocations" description:nil
                                                              storyboard:@"TaggedLocations"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Tabster" description:nil
                                                              storyboard:@"Tabster"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TVAnimationsGestures" description:nil
                                                              storyboard:@"TVAnimationsGestures"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CustomTableViewCell" description:nil
                                                              storyboard:@"CustomTableViewCell"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TableViewCellSubviews" description:nil
                                                              storyboard:@"TableViewCellSubviews"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleIndexedTableView" description:nil
                                                              storyboard:@"SimpleIndexedTableView"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TableSearch" description:nil
                                                              storyboard:@"TableSearch"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MultiSelectTableView" description:nil
                                                              storyboard:@"MultiSelectTableView"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SysSound" description:nil
                                                              storyboard:@"SysSound"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-StreetScroller" description:nil
                                                              storyboard:@"StreetScroller"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-IAPStoreProductViewController" description:nil storyboard:@"IAPStoreProductViewController"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-StitchedStreamPlayer" description:nil
                                                              storyboard:@"StitchedStreamPlayer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-StateRestoreChildViews" description:nil
                                                              storyboard:@"StateRestoreChildViews"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-StateRestore" description:nil
                                                              storyboard:@"StateRestore"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleURLConnections" description:nil
                                                              storyboard:@"SimpleURLConnections"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleUndo" description:nil
                                                              storyboard:@"SimpleUndo"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleNetworkStreams" description:nil
                                                              storyboard:@"SimpleNetworkStreams"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleGestureRecognizers" description:nil
                                                              storyboard:@"SimpleGestureRecognizers"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleFTPSample" description:nil
                                                              storyboard:@"SimpleFTPSample"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleEKDemo" description:nil
                                                              storyboard:@"SimpleEKDemo"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SimpleBackgroundTransfer" description:nil
                                                              storyboard:@"SimpleBackgroundTransfer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SeismicXML" description:nil
                                                              storyboard:@"SeismicXML"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-NetworkReachability" description:nil
                                                              storyboard:@"NetworkReachability"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-QuickContacts" description:nil
                                                              storyboard:@"QuickContacts"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-QuartzDemo" description:nil
                                                              storyboard:@"QuartzDemo"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PVRTextureLoader" description:nil
                                                              storyboard:@"PVRTextureLoader"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PrivacyPrompts" description:nil
                                                              storyboard:@"PrivacyPrompts"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PrefsInCloud" description:nil
                                                              storyboard:@"PrefsInCloud"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Popovers" description:nil
                                                              storyboard:@"Popovers"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PocketCoreImage" description:nil
                                                              storyboard:@"PocketCoreImage"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PhotoScroller" description:nil
                                                              storyboard:@"PhotoScroller"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PhotoPicker" description:nil
                                                              storyboard:@"PhotoPicker"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PhotoMap" description:nil
                                                              storyboard:@"PhotoMap"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PhotoLocations" description:nil
                                                              storyboard:@"PhotoLocations"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PhotoHandoff" description:nil
                                                              storyboard:@"PhotoHandoff"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PARk" description:nil
                                                              storyboard:@"pARk"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PageControl" description:nil
                                                              storyboard:@"PageControl"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-PackagedDocument" description:nil
                                                              storyboard:@"PackagedDocument"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-OalTouch" description:nil
                                                              storyboard:@"oalTouch"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-NavBar" description:nil
                                                              storyboard:@"NavBar"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MyImagePicker" description:nil
                                                              storyboard:@"MyImagePicker"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MVCNetworking" description:nil
                                                              storyboard:@"MVCNetworking"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MultipleDetailViews" description:nil
                                                              storyboard:@"MultipleDetailViews"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MultipeerGroupChat" description:nil
                                                              storyboard:@"MultipeerGroupChat"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-UICatalogMaster" description:nil
                                                              storyboard:@"UICatalogMaster"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MoviePlayer" description:nil
                                                              storyboard:@"MoviePlayer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MoveMe" description:nil
                                                              storyboard:@"MoveMe"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MotionGraphs" description:nil
                                                              storyboard:@"MotionGraphs"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MotionEffects" description:nil
                                                              storyboard:@"MotionEffects"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MessageComposer" description:nil
                                                              storyboard:@"MessageComposer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ManagedAppConfig" description:nil
                                                              storyboard:@"ManagedAppConfig"]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-LookInside" description:nil
                                                         class:[LookInsideRootViewController class]]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-LocateMe" description:nil
                                                              storyboard:@"LocateMe"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-LoadPresetDemo" description:nil
                                                              storyboard:@"LoadPresetDemo"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Lister" description:nil
                                                              storyboard:@"Lister"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ListAdder" description:nil
                                                              storyboard:@"ListAdder"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-LazyTableImages" description:nil
                                                              storyboard:@"LazyTableImages"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-LaunchMe" description:nil
                                                              storyboard:@"LaunchMe"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-LargeImageDownsizing" description:nil
                                                              storyboard:@"LargeImageDownsizing"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-KeychainTouchID" description:nil
                                                              storyboard:@"KeychainTouchID"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-KeyboardAccessory" description:nil
                                                              storyboard:@"KeyboardAccessory"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-IPhoneCoreDataRecipes" description:nil
                                                              storyboard:@"IPhoneCoreDataRecipes"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-InternationalMountains" description:nil
                                                              storyboard:@"InternationalMountains"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-InterAppAudioSampler" description:nil
                                                              storyboard:@"InterAppAudioSampler"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-Icons" description:nil
                                                              storyboard:@"Icons"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-BasicBanner" description:nil
                                                              storyboard:@"BasicBanner"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ContainerBanner" description:nil
                                                              storyboard:@"ContainerBanner"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-MediumRectBanner" description:nil
                                                              storyboard:@"MediumRectBanner"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SplitNavigationBanner" description:nil
                                                              storyboard:@"SplitNavigationBanner"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-TabbedBanner" description:nil
                                                              storyboard:@"TabbedBanner"]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-BasicBanner_Coded" description:nil
                                                         class:[BasicBanner_Coded class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-ContainerBanner_Coded" description:nil
                                                         class:[ContainerBanner_Coded class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-MediumRectBanner_Coded" description:nil
                                                         class:[MediumRectBanner_Coded class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-SplitNavigationBanner_Coded" description:nil
                                                         class:[SplitNavigationBanner_Coded class]]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-TabbedBanner_Coded" description:nil
                                                         class:[TabbedBanner_Coded class]]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ADMagazine" description:nil
                                                              storyboard:@"ADMagazine"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-ADGame" description:nil
                                                              storyboard:@"ADGame"]];
    [mNSMutableArray addObject: [PagerInfo newInstanceWithName:@"IOSSample-HelloGoodbye" description:nil
                                                         class:[HelloGoodbye class]]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-HeadsUpUI" description:nil
                                                              storyboard:@"HeadsUpUI"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-GenericKeychainAPP1" description:nil
                                                              storyboard:@"GenericKeychainAPP1"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-GenericKeychainAPP2" description:nil
                                                              storyboard:@"GenericKeychainAPP2"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-SamplePhotosApp" description:nil
                                                              storyboard:@"SamplePhotosApp"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-DynamicsCatalog" description:nil
                                                              storyboard:@"DynamicsCatalog"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-DownloadFont" description:nil
                                                              storyboard:@"DownloadFont"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-DocInteraction" description:nil
                                                              storyboard:@"DocInteraction"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-DateSectionTitles" description:nil
                                                              storyboard:@"DateSectionTitles"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-DateCell" description:nil
                                                              storyboard:@"DateCell"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CustomHTTPProtocol" description:nil
                                                              storyboard:@"CustomHTTPProtocol"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CustomContentAccessibility" description:nil
                                                              storyboard:@"CustomContentAccessibility"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CustomAnimatableProperty" description:nil
                                                              storyboard:@"CustomAnimatableProperty"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CoreTextPageViewer" description:nil
                                                              storyboard:@"CoreTextPageViewer"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CoreDataBooks" description:nil
                                                              storyboard:@"CoreDataBooks"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CollectionViewTransition" description:nil
                                                              storyboard:@"CollectionViewTransition"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-CollectionView" description:nil
                                                              storyboard:@"CollectionView"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-BatteryStatus" description:nil
                                                              storyboard:@"BatteryStatus"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-AvTouch" description:nil
                                                              storyboard:@"avTouch"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-AVTimedAnnotationWriter" description:nil
                                                              storyboard:@"AVTimedAnnotationWriter"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-AVSimpleEditor" description:nil
                                                              storyboard:@"AVSimpleEditor"]];
    [mNSMutableArray addObject: [PagerInfoStoryboard newInstanceWithName:@"IOSSample-AVPlayerDemo" description:nil
                                                              storyboard:@"AVPlayerDemo"]];
}
// 加载其他开源例子
-(void)loadIOSOpenSourceExample:(NSMutableArray *) mNSMutableArray{
    
}
@end
