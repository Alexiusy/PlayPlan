//
//  ContainerController.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ContainerController.h"

@implementation ContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
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
    [[Overlay sharedOverlay] showView:sideBar WithBlur:YES];
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)gesture {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
