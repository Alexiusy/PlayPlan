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

- (void)sideMenu:(UIButton *)menu title:(NSString *)title;

@end

@interface SideMenu : UIView

@property (nonatomic, assign) id<SideMenuDelegate> delegate;

@end

@interface Source : NSObject <UITableViewDataSource, UITableViewDelegate>

@end