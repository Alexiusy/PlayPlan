//
//  ProfileViewController.m
//  PlayPlan
//
//  Created by Zeacone on 15/11/8.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (nonatomic) UITableView *tableview;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setMaskBackgroundColor:[UIColor clearColor]];
    [self loadTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar reset];
}

#pragma mark - Config View

- (void)loadTableView {
    self.tableview = ({
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 164)];
        headerView.backgroundColor = [UIColor purpleColor];
        tableview.tableHeaderView = headerView;
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview;
    });
    [self.view addSubview:self.tableview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
