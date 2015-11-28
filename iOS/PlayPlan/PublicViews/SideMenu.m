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
        self.backgroundColor = [UIColor clearColor];
//        [[Overlay sharedOverlay] showView:self WithBlur:YES];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutMenus];
}

- (void)layoutMenus {
    Source *source = [[Source alloc] init];
    UITableView *menuTable = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.frame];
        tableView.delegate = source;
        tableView.dataSource = source;
        tableView.backgroundColor = [UIColor clearColor];
        tableView;
    });
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

@implementation Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"Menu";
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

@end
