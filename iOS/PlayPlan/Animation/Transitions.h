//
//  Transitions.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/23.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresentAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

@interface DismissAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

@interface PushAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end

@interface PopAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@end