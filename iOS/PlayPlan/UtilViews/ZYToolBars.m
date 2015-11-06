//
//  ZYTabBar.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/4.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ZYToolBars.h"

@implementation ZYTabBar

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

@end


@implementation UINavigationBar (ZYNavBar)

static char maskKey;

- (UIView *)mask {
    return objc_getAssociatedObject(self, &maskKey);
}

- (void)setMask:(UIView *)mask {
    objc_setAssociatedObject(self, &maskKey, mask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (!self.mask) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.mask = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.mask.userInteractionEnabled = NO;
        self.mask.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.mask atIndex:0];
    }
}

- (void)setAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
}

- (void)setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.mask removeFromSuperview];
    self.mask = nil;
}

@end

@implementation ZYNavgationBar

- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[UIImage imageNamed:@"translucent"] forBarMetrics:UIBarMetricsDefault];
    self.barStyle = UIBarStyleBlackTranslucent;
}

@end
