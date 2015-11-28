//
//  SideMenu.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/19.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "SideMenu.h"

@implementation SideMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
//        [[Overlay sharedOverlay] showView:self WithBlur:YES];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)layoutMenus {
    UITableView *menuTable = [[UITableView alloc] initWithFrame:self.frame];
    menuTable.delegate = self;
    menuTable.dataSource = self;
    [self addSubview:menuTable];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
