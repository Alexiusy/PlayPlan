//
//  Transitions.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/23.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "Transitions.h"

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // Get cntrollers from transition context.
    UIViewController *destViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get rect of destination view controller.
    CGRect finalRect = [transitionContext finalFrameForViewController:destViewController];
    
    // Make sure that the controller come from the bottom.
    destViewController.view.frame = CGRectOffset(finalRect, 0, [[UIScreen mainScreen]bounds].size.height);
    
    // Add controller's view to container view.
    [[transitionContext containerView]addSubview:destViewController.view];
    
    // Do animate now.
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        destViewController.view.frame = finalRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end

@implementation DismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end