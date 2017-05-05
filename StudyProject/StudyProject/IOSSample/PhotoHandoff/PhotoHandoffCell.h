/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  Custom collection view cell for displaying image and its label.
  
 */

#import <UIKit/UIKit.h>

@interface PhotoHandoffCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end
