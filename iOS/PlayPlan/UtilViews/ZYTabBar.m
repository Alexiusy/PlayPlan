//
//  ZYTabBar.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/4.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ZYTabBar.h"

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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"123");
    }
    return self;
}

- (UIColor *)backgroundColor {
    return [UIColor redColor];
}

@end
