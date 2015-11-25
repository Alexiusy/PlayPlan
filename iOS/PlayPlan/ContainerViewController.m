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
    self.view.backgroundColor = [UIColor redColor];
    
    // 添加初始化的controller
    self.storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mainController = [self.storyBoard instantiateViewControllerWithIdentifier:@"mainController"];
    self.mainController.delegate = self;
    self.locationController = [self.storyBoard instantiateViewControllerWithIdentifier:@"locationController"];
    self.locationController.delegate = self;
    self.profileController = [self.storyBoard instantiateViewControllerWithIdentifier:@"profileController"];
    self.profileController.delegate = self;
    [self addChildViewController:self.mainController];
    [self.view addSubview:self.mainController.view];
    
    // 添加左侧边缘滑动手势
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    [self.view addGestureRecognizer:edgePanGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawer" style:UIBarButtonItemStylePlain target:self action:@selector(showDrawer)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)showDrawer {
    SideMenu *sideBar = [[SideMenu alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE.width / 2, SCREEN_SIZE.height - 64)];
    sideBar.delegate = self;
    [[Overlay sharedOverlay] showView:sideBar WithBlur:YES blurRect:CGRectMake(0, 64, SCREEN_SIZE.width, SCREEN_SIZE.height - 64)];
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)gesture {
    
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

@end
