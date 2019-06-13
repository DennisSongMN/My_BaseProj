//
//  TAAnimatedDotView.m
//  TAPageControl
//
//  Created by Tanguy Aladenise on 2015-01-22.
//  Copyright (c) 2015 Tanguy Aladenise. All rights reserved.
//

#import "TAAnimatedDotView.h"

static CGFloat const kAnimateDuration = 1;

@implementation TAAnimatedDotView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self initialization];
    }
    
    return self;
}

- (void)initialization{
    
    self.backgroundColor    = [UIColor clearColor];
    
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    
    self.layer.borderWidth  = 2;
}

- (void)changeActivityState:(BOOL)active{
    
    if (active) {
        
        [self animateToActiveState];
        
    } else {
        
        [self animateToDeactiveState];
    }
}

- (void)animateToActiveState{
    
    [UIView animateWithDuration:kAnimateDuration
                          delay:0
         usingSpringWithDamping:.5
          initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
        self.backgroundColor = [UIColor whiteColor];
                         
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
                         
    } completion:nil];
}

- (void)animateToDeactiveState{
    
    [UIView animateWithDuration:kAnimateDuration delay:0
         usingSpringWithDamping:.5 initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
        self.backgroundColor = [UIColor clearColor];
                         
        self.transform = CGAffineTransformIdentity;
                         
    } completion:nil];
}

@end
