//
//  PagerInfo.m
//  StudyProject
//
//  Created by XiaoTian on 12/30/14.
//  Copyright (c) 2014 XiaoTian. All rights reserved.
//

#import "PagerInfo.h"



@implementation PagerInfo

+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description class:(Class) pageClass{
    PagerInfo *pageInfo = [[PagerInfo alloc] initWithName:label description:description class:pageClass];
    return pageInfo;
}

#pragma mark - 实体类实例化方法

-(instancetype) initWithName:(NSString *) label description:(NSString *) description class:(Class) pageClass{
    self = [super init];
    if(self){
        _pageLabel = label;
        _viewController = pageClass;
        _pageDescription = description;
    }
    return self;
}

#pragma mark - 私有方法

@end

@implementation PagerInfoStoryboard
+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description storyboard:(NSString *) storyboard{
    PagerInfoStoryboard *pageInfo = [[PagerInfoStoryboard alloc] initWithName:label description:description storyboard:storyboard];
    return pageInfo;
}
-(instancetype) initWithName:(NSString *) label description:(NSString *) description storyboard:(NSString *) storyboard{
    self = [super init];
    if(self){
        [self setPageLabel:label];
        [self setPageDescription:description];
        [self setStoryboardName:storyboard];
    }
    return self;
}
@end

@implementation PagerInfoXib
+(instancetype) newInstanceWithName:(NSString *) label description:(NSString *) description xib:(NSString *) xib{
    PagerInfoXib *pageInfo = [[PagerInfoXib alloc] initWithName:label description:description xib:xib];
    return pageInfo;
}
-(instancetype) initWithName:(NSString *) label description:(NSString *) description xib:(NSString *) xib{
    self = [super init];
    if(self){
        [self setPageLabel:label];
        [self setPageDescription:description];
        [self setXibName:xib];
    }
    return self;
}
@end
