//
//  WheelView.m
//  Wheel
//
//  Created by koba on 7/31/10.
//  Copyright 2010 Mudphone.com. All rights reserved.
//

#import "WheelView.h"


@implementation WheelView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
        currentTheta = 0.0;
        currentlyAnimating = NO;
    }
    return self;
}

- (float)thetaForX:(float)x andY:(float)y {
    float theta = atan(y / x);
    if (x < 0 && y > 0) {
        theta = (M_PI / 2) + (M_PI / 2 + theta);
    } else if (x < 0 && y < 0) {
        theta = M_PI + theta;
    } else if (x > 0 && y < 0) {
        theta = 2 * M_PI + theta;
    }
    return theta;
}

- (float)rotationThetaForNewTheta:(float)newTheta {
    float rotationTheta;
    if (currentTheta > (3 * M_PI / 2) && (newTheta < M_PI / 2)) {
        rotationTheta = newTheta + (2 * M_PI - currentTheta);
    } else {
        rotationTheta = newTheta - currentTheta;
    }
    return rotationTheta;
}

- (float)thetaForTouch:(UITouch *)touch onView:view {
    CGPoint location = [touch locationInView:view];
    float xOffset = self.bounds.size.width / 2;
    float yOffset = self.bounds.size.height / 2;
    float centeredX = location.x - xOffset;
    float centeredY = location.y - yOffset;
    return [self thetaForX:centeredX andY:centeredY];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // user places finger on view
    // receives only touches that just began
    // touches have positions and stages
    UITouch* touch = [touches anyObject];
    currentTheta = [self thetaForTouch:touch onView:self];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // set of touches that just changed
    if (currentlyAnimating) {
        return;
    }
    currentlyAnimating = YES;
    UITouch* touch = [touches anyObject];
    float theta = [self thetaForTouch:touch onView:self.superview];
//        touchRadiansLabel.text = [NSString stringWithFormat:@"x: %f  y: %f  theta: %f", centeredX, centeredY, theta];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationRepeatCount:20];
//    [UIView setAnimationRepeatAutoreverses:YES];
//    [UIView setAnimationCurve:UIViewAnimationOptionCurveEaseInOut];
    self.transform = CGAffineTransformMakeRotation([self rotationThetaForNewTheta:theta]);
    [UIView commitAnimations];
    currentlyAnimating = NO;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // entire gesture finished (as opposed to touchesCancelled)
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    // app interrupted during gesture
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
