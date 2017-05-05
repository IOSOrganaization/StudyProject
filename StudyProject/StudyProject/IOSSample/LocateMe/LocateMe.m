/*
Copyright (C) 2014 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

*/

#import "LocateMe.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocateMe

- (void)awakeFromNib{
    if (![CLLocationManager locationServicesEnabled]) {
        // location services is disabled, alert user
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"DisabledTitle", @"DisabledTitle") message:NSLocalizedString(@"DisabledMessage", @"DisabledMessage") delegate:nil cancelButtonTitle:NSLocalizedString(@"OKButtonTitle", @"OKButtonTitle") otherButtonTitles:nil];
        [servicesDisabledAlert show];
    }
}

@end
