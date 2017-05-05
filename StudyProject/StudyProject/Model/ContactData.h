//
//  ContactData.h
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ContactData : NSManagedObject

@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * postCode;

@end
