//
//  SideMenu.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/19.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayPlan.h"

@protocol SideMenuDelegate <NSObject>

- (void)sideMenu:(UITableView *)menuTable title:(NSString *)title;

@end

@interface SideMenu : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) id<SideMenuDelegate> delegate;

@property (nonatomic, strong) NSArray *menus;
@property (nonatomic, strong) NSArray *icons;

@end