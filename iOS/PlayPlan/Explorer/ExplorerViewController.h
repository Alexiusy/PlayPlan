//
//  ProfileViewController.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/8.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayPlan.h"

@class ProfileViewController;

@protocol ProfileDelegate <NSObject>

- (void)dismissProfileViewController:(ProfileViewController *)profileViewController;

@end

@interface ProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id<ProfileDelegate> delegate;

@end
