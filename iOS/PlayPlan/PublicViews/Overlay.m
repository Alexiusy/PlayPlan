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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
