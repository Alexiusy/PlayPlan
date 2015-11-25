//
//  ContainerController.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import "PlayPlan.h"
#import "SideMenu.h"
#import "MainViewController.h"
#import "LocationViewController.h"
#import "ProfileViewController.h"

@interface ContainerViewController : UIViewController

@property (nonatomic, strong) UIStoryboard           *storyBoard;
@property (nonatomic, strong) MainViewController     *mainController;
@property (nonatomic, strong) LocationViewController *locationController;
@property (nonatomic, strong) ProfileViewController  *profileController;

@end
