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
    
//    self.currentViewController = [[UIViewController alloc] init];
    self.currentViewController = self.mainController;
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
    
    // 添加左侧边缘滑动手势
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    [self.view addGestureRecognizer:edgePanGesture];
    
    // 添加浮动按钮
    UIButton *globalFloatingButton = ({
        UIButton *button = [[UIButton alloc] init];
        [button setFrame:CGRectMake(SCREEN_SIZE.width - 50, SCREEN_SIZE.height - 50, 50, 50)];
        [button addTarget:self action:@selector(showTabbar:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 25;
        button;
    });
    [self.view addSubview:globalFloatingButton];
}

- (void)showTabbar:(UIButton *)sender {
    if (sender.isSelected) {
        // TODO: 添加导航条并且实现伸展动画
    } else {
        //TODO: 收起导航条并且实现收缩动画
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.DynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawer" style:UIBarButtonItemStylePlain target:self action:@selector(showDrawer)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)showDrawer {
    SideMenu *sideBar = [[SideMenu alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE.width / 2, SCREEN_SIZE.height - 64)];
    sideBar.delegate = self;
    [[Overlay sharedOverlay] showView:sideBar WithBlur:YES blurRect:sideBar.frame];
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)gesture {
    NSLog(@"Edge pan effected.");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

#pragma mark - ---Delegate of controllers

- (void)dismissMainViewController:(MainViewController *)mainViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissLocationViewController:(LocationViewController *)locationViewController {
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
