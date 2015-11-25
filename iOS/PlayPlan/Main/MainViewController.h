//
//  ViewController.h
//  PlayPlan
//
//  Created by Zeacone on 15/10/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import "PlayPlan.h"
#import "SideMenu.h"

@class MainViewController;

@protocol MainDelegate <NSObject>

- (void)dismissMainViewController:(MainViewController *)mainViewController;

@end

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id<MainDelegate> delegate;

@end