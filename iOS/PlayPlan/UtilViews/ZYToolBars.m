//
//  ZYTabBar.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/4.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ZYToolBars.h"

@implementation ZYTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation ZYNavgationBar

- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor clearColor];
    self.shadowImage = [[UIImage alloc] init];
    self.barStyle = UIBarStyleBlackTranslucent;
    [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
}

@end
