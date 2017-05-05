//
//  DataModelPersistent.m
//  FirstStydyProject
//
//  Created by XiaoTian on 13-8-7.
//  Copyright (c) 2013年 XiaoTian. All rights reserved.
//
#import <CoreData/CoreData.h>
#import "DataModelPersistent.h"
#import "ContactData.h"

@implementation DataModelPersistent
-(void)baseMethod{
    [self sqlLiteStoreMethod];
}
// Data Model :: SQLLite模式的数据存储
-(void) sqlLiteStoreMethod{
    // 1.引入CodeData框架
    // 2.创建DataModel数据对象模型
    // 3.在数据模型中创建Entity实体类对象,并为实体类对象添加属性
    // 4.生成实体对象的类文件[选中Entity实体,Editor->create NSManagedObject Subclass命令]
    
    NSManagedObjectModel *managerModel ; // 引入CodeData.h框架头文件[实体关联对象模型]
    NSPersistentStoreCoordinator *coordinator; // 实体对象管理器
    NSManagedObjectContext *objectContext ;
    
    managerModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managerModel];
    // 保存对象持久化的位置Path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *filePath = [documentsDir stringByAppendingPathComponent:@"datastore.sqlite"];
    NSURL *databaseURL = [NSURL fileURLWithPath:filePath]; // 构造文件URL统一资源定位
    
    NSError *error;
    // 关联实体保存Path到实体管理器
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:databaseURL options:nil error:&error];
    objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:coordinator]; // 设置关联上下文到实体管理器
    
    // 保存对象到实体持久化管理器对象中
    ContactData *newContact = (ContactData *)[NSEntityDescription insertNewObjectForEntityForName:@"ContactData" inManagedObjectContext:objectContext]; // 在实体管理器上下文中插入名称为ContactData的新实体对象
    newContact.customerName = @"XiaoTian";
    newContact.phoneNumber = @"12036656236";
    newContact.postCode = @"510000";
    if([objectContext save:&error]){ // 保存成功
        // 保存对象到持久化上下文中
        // 获取当前持久化上下文中的对象信息
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];// 获取请求对象
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ContactData" inManagedObjectContext:objectContext]; // 取得对象实体描述对象信息[根据实体的名称取得描述对象]
        [fetchRequest setEntity:entityDescription]; // 设置获取对象的获取实体描述[设置获取实体]
        NSArray *existingContacts = [objectContext executeFetchRequest:fetchRequest error:&error]; // 取得持久化上下文中的fetch对象
        for(int i = 0; i< [existingContacts count]; i++){
            ContactData *data = (ContactData *)[existingContacts objectAtIndex:i]; // 迭代对象实体
//            [MyLog info:@"%@",data];
        }
    }
}
@end
