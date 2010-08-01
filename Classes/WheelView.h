//
//  WheelView.h
//  Wheel
//
//  Created by koba on 7/31/10.
//  Copyright 2010 Mudphone.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WheelView : UIView {
    IBOutlet UIView* stationaryView;
    IBOutlet UIImageView* dubyaImageView;
    IBOutlet UILabel* touchRadiansLabel;
    float currentTheta;
    BOOL currentlyAnimating;
}

@end
