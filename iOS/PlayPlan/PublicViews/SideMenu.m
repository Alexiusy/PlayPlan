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
        
        self.menus = [[NSArray alloc] initWithObjects:@"Main", @"Activity", @"Location", @"Profile", nil];
        self.icons = [NSArray new];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutMenus];
}

- (void)layoutMenus {
    UITableView *menuTable = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        tableView;
    });
    [self addSubview:menuTable];
}

#pragma mark - ---Delegate and datasource of tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.menus[indexPath.row];
    //    cell.imageView.image = self.icons[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sideMenu:title:)]) {
        [self.delegate sideMenu:tableView title:self.menus[indexPath.row]];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end