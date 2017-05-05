/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  The primary collection view controller for this app.
  
 */

#import <UIKit/UIKit.h>

@class PhotoHandoffDataSource;

@interface PhotoHandoffViewController : UICollectionViewController

@property (nonatomic, strong) PhotoHandoffDataSource *dataSource;

// these are used by the AppDelegate
- (BOOL)handleUserActivity:(NSUserActivity *)userActivity;
- (void)prepareForActivity;
- (void)handleActivityFailure;

@end
