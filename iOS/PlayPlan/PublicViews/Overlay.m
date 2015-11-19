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
    // Get frame of key window.
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    dispatch_once(&onceToken, ^{
        UIERealTimeBlurView *blurView = [[UIERealTimeBlurView alloc] initWithFrame:keyWindow.frame];
        overlay = [[Overlay alloc] initWithFrame:keyWindow.frame];
        [overlay addSubview:blurView];
    });
    return overlay;
}

- (void)showOverlayWithBlur:(BOOL)blur {
    UIControl *tap = [[UIControl alloc] initWithFrame:keyWindow.frame];
    [tap addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tap:(UIControl *)tap {
    UIView *view = [[UIView new] viewWithTag:'view'];
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, SCREEN_SIZE.height / 2);
    } completion:^(BOOL finished) {
        [tap.superview removeFromSuperview];
        [tap removeFromSuperview];
        [view removeFromSuperview];
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