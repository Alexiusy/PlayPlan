//
//  ContainerController.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ContainerViewController.h"

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加初始化的controller
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mainController = [self.storyBoard instantiateViewControllerWithIdentifier:@"mainController"];
    self.mainController.delegate = self;
    
    // 将初始化的Controller设置为当前正在使用的Controller
    self.currentViewController = self.mainController;
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
    
    // 添加抽屉按钮，以及所需要的动力学动画手势等
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    sideBar = [[SideMenu alloc] initWithFrame:CGRectMake(-SCREEN_SIZE.width / 2, 20, SCREEN_SIZE.width / 2, SCREEN_SIZE.height - 20)];
    sideBar.delegate = self;
    [self.view addSubview:sideBar];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    [self.view addGestureRecognizer:swipeGesture];
    
    UISwipeGestureRecognizer *closeMenuBarGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    [closeMenuBarGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [sideBar addGestureRecognizer:closeMenuBarGesture];
    [self.view addGestureRecognizer:closeMenuBarGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(showDrawer)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)showDrawer {
    [self toggleMenu:NO];
}

- (void)toggleMenu:(BOOL)shouldOpenMenu {
    
    if (!shouldOpenMenu) {
        [Overlay sharedOverlay].clickHandler = ^{
            [[Overlay sharedOverlay] removeFromSuperview];
        };
    } else {
        [[Overlay sharedOverlay] showView:nil On:self.view WithBlur:YES Rect:self.view.frame];
    }
    
    [self.dynamicAnimator removeAllBehaviors];
    [self.view bringSubviewToFront:sideBar];
    
    
    
    CGFloat gravityDirectionX = shouldOpenMenu ? 1.0 : -1.0;
    CGFloat pushMagnitude = shouldOpenMenu ? 20.0 : -20.0;
    CGFloat boundaryPointX = shouldOpenMenu ? SCREEN_SIZE.width / 2 : -SCREEN_SIZE.width / 2;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[sideBar]];
    gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX, 0.0);
    [self.dynamicAnimator addBehavior:gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[sideBar]];
    [collisionBehavior addBoundaryWithIdentifier:@"menuBoundary"
                                       fromPoint:CGPointMake(boundaryPointX, 20.0)
                                         toPoint:CGPointMake(boundaryPointX, SCREEN_SIZE.height)];
    [self.dynamicAnimator addBehavior:collisionBehavior];
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[sideBar] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.magnitude = pushMagnitude;
    [self.dynamicAnimator addBehavior:pushBehavior];
    
    UIDynamicItemBehavior *menuViewBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[sideBar]];
    menuViewBehavior.elasticity = 0.4;
    [self.dynamicAnimator addBehavior:menuViewBehavior];
}

- (void)showMenuBar:(UIButton *)sender {
    if (sender.isSelected) {
        // TODO: 添加导航条并实现伸展动画
    } else {
        //TODO: 收起导航条并实现收缩动画
    }
}

- (void)edgePan:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self toggleMenu:YES];
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self toggleMenu:NO];
    }
}

#pragma mark - ---Delegate of controllers

- (void)dismissMainViewController:(MainViewController *)mainViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissLocationViewController:(NearbyViewController *)locationViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissProfileViewController:(ProfileViewController *)profileViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ---Delegate of SideMenu

- (void)sideMenu:(UITableView *)menuTable title:(NSString *)title {
    
    // 移除当前控制器和试图
    [self.currentViewController.view removeFromSuperview];
    [self.currentViewController removeFromParentViewController];
    
    if ([title isEqualToString:@"Main"]) {
        self.currentViewController = self.mainController;
    } else if ([title isEqualToString:@"Location"]) {
        self.locationController = [self.storyBoard instantiateViewControllerWithIdentifier:@"locationController"];
        self.locationController.delegate = self;
        self.currentViewController = self.locationController;
    } else if ([title isEqualToString:@"Profile"]) {
        self.profileController = [self.storyBoard instantiateViewControllerWithIdentifier:@"profileController"];
        self.profileController.delegate = self;
        self.currentViewController = self.profileController;
    }
    
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
}

@end
