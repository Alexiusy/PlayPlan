//
//  ViewController.m
//  PlayPlan
//
//  Created by Zeacone on 15/10/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic) UITableView *tableview;

@end

@implementation MainViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.navigationController.navigationBar setMaskBackgroundColor:[UIColor clearColor]];
    [self loadTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawer" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
        
    } else {
        [self setNavigationBarTransformProgress:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
}

- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar setMaskAlpha:(1 - progress)];
}

#pragma mark - TableView datasource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Section = %@, row = %@", @(indexPath.section), @(indexPath.row)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self addPopView];
}

- (void)addPopView {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    UIView *overlay = [[UIView alloc] initWithFrame:keyWindow.frame];
    overlay.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    UIControl *tap = [[UIControl alloc] initWithFrame:keyWindow.frame];
    [tap addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_SIZE.height, SCREEN_SIZE.width, SCREEN_SIZE.height)];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)];
    [view addGestureRecognizer:panGesture];
    view.tag = 'view';
    view.backgroundColor = [UIColor redColor];
    
    [overlay addSubview:tap];
    [overlay addSubview:view];
    
    [keyWindow addSubview:overlay];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, -SCREEN_SIZE.height / 2);
    }];
}

- (void)dragView:(UIPanGestureRecognizer *)pan {
    CGPoint offset = [pan translationInView:self.view];
    CGFloat moveHeight = offset.y - pan.view.center.y;
    if (pan.view) {
        pan.view.transform = CGAffineTransformMakeTranslation(0, offset.y);
//        [pan setTranslation:CGPointZero inView:self.view];
    }
}

- (UIImage *)blurredImage {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, self.view.window.screen.scale);
    [self.tableview drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    return snapshot;
}

- (void)tap:(UIControl *)tap {
    UIView *view = [[UIView new] viewWithTag:'view'];
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformMakeTranslation(0, SCREEN_SIZE.height / 2);
    } completion:^(BOOL finished) {
        [tap.superview removeFromSuperview];
        [tap removeFromSuperview];
        [view removeFromSuperview];
    }];
    
    NSLog(@"tap");
}

@end
