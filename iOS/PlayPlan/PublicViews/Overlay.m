//
//  Overlay.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/18.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "Overlay.h"

@implementation Overlay

+ (instancetype)sharedOverlay {
    static Overlay *overlay = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        overlay = [[Overlay alloc] init];
    });
    return overlay;
}

- (void)showOnView:(UIView *)view WithBlur:(BOOL)blur blurRect:(CGRect)blurRect {
    
    self.frame = blurRect;
    // 先移除所有的子视图
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    if (blur) {
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithFrame:blurRect];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        visualEffectView.effect = blurEffect;//[UIVibrancyEffect effectForBlurEffect:blurEffect];
        [self addSubview:visualEffectView];
    }
    
    UIControl *tap = [[UIControl alloc] initWithFrame:blurRect];
    [tap addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tap];
    
    [view addSubview:self];
}

- (void)tap:(UIControl *)tap {
    [self removeFromSuperview];
    UIView *view = [[UIView new] viewWithTag:'view'];
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, SCREEN_SIZE.height / 2);
    } completion:^(BOOL finished) {
        [tap.superview removeFromSuperview];
        [tap removeFromSuperview];
        [self removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
