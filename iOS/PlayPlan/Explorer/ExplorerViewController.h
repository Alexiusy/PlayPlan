//
//  ProfileViewController.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/8.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayPlan.h"

@class ExplorerViewController;

@protocol ExplorerDelegate <NSObject>

- (void)dismissExplorerViewController:(ExplorerViewController *)explorerViewController;

@end

@interface ExplorerViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id<ExplorerDelegate> delegate;

@end
