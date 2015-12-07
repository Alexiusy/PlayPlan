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

- (void)showView:(UIView *)subView On:(UIView *)superView WithBlur:(BOOL)blur Rect:(CGRect)rect {
    
    self.frame = rect;
    
    // 先移除所有的子视图
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    if (blur) {
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithFrame:rect];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        visualEffectView.effect = blurEffect;//[UIVibrancyEffect effectForBlurEffect:blurEffect];
        [self addSubview:visualEffectView];
    }
    
    UIControl *tap = [[UIControl alloc] initWithFrame:rect];
    [tap addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tap];
    
    [self addSubview:subView];
    
    [superView addSubview:self];
}

- (void)tap:(UIControl *)tap {
    
    UIView *view = [[UIView new] viewWithTag:'view'];
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, SCREEN_SIZE.height / 2);
    } completion:^(BOOL finished) {
        for (UIView *subview in self.subviews) {
            [subview removeFromSuperview];
        }
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
