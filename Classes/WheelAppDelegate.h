//
//  WheelAppDelegate.h
//  Wheel
//
//  Created by koba on 7/31/10.
//  Copyright Mudphone.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WheelViewController;

@interface WheelAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WheelViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WheelViewController *viewController;

@end

