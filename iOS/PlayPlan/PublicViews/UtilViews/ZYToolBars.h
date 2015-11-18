//
//  ZYTabBar.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/4.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "PlayPlan.h"

@interface ZYTabBar : UITabBar

@end

/**
 *  Customize our navigation bar.
 */

@interface UINavigationBar (ZYNavBar)

- (void)setMaskBackgroundColor:(UIColor *)backgroundColor;
- (void)setMaskAlpha:(CGFloat)alpha;
- (void)setTranslationY:(CGFloat)translationY;
- (void)reset;

@end

@interface ZYNavgationBar : UINavigationBar

@end
