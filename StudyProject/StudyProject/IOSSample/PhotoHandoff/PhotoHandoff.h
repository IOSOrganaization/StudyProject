/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  The sample's application delegate.
  
 */

#import <UIKit/UIKit.h>

@class PhotoHandoffDataSource;

@interface PhotoHandoff : UINavigationController

@property (nonatomic, readonly) PhotoHandoffDataSource *dataSource;

@end
