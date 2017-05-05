//
//  PagerInfo.h
//  StudyProject
//
//  Created by XiaoTian on 12/30/14.
//  Copyright (c) 2014 XiaoTian. All rights reserved.
//

#import "Headers.h"

@interface PagerInfo : NSObject

@property (nonatomic, copy) NSString *pageLabel;/*标签*/
@property (nonatomic, copy) NSString *pageDescription;/*描述*/
@property (nonatomic) Class viewController;/*页面*/
// Constructor
+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description class:(Class) pageClass;
-(instancetype) initWithName:(NSString *) label description:(NSString *) description class:(Class) pageClass;
@end

@interface PagerInfoStoryboard : PagerInfo

@property (nonatomic, copy) NSString *storyboardName;/*故事版名称*/
+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description storyboard:(NSString *) storyboard;
-(instancetype) initWithName:(NSString *) label description:(NSString *) description storyboard:(NSString *) storyboard;
@end

@interface PagerInfoXib : PagerInfo

@property (nonatomic, copy) NSString *xibName;/*xib布局UI名称*/
+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description xib:(NSString *) xib;
-(instancetype) initWithName:(NSString *) label description:(NSString *) description xib:(NSString *) xib;
@end