//
//  ViewController.m
//  PlayPlan
//
//  Created by Zeacone on 15/10/25.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

@interface ViewController ()

@property (nonatomic) UITableView *tableview;
@property (nonatomic) NSMutableArray *mainArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self loadTableView];
    [self mainInterface];
}

- (void)mainInterface {
    UIView *showView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width * 0.15, SCREEN_SIZE.height * 0.15, SCREEN_SIZE.width * 0.7, SCREEN_SIZE.height * 0.7)];
        view.backgroundColor = [UIColor redColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 1.0;
        view.tag = 100;
        view;
    });
    
    UIView *secondView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width * 0.15, SCREEN_SIZE.height * 0.15, SCREEN_SIZE.width * 0.7, SCREEN_SIZE.height * 0.7)];
        view.backgroundColor = [UIColor greenColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 1.0;
        view;
    });
    
    UIView *thirdView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width * 0.15 + 10, SCREEN_SIZE.height * 0.85, SCREEN_SIZE.width * 0.7 - 20, 10)];
        view.backgroundColor = [UIColor clearColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 1.0;
        view;
    });
    
    UIView *fourthView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width * 0.15 + 20, SCREEN_SIZE.height * 0.85 + 10, SCREEN_SIZE.width * 0.7 - 40, 10)];
        view.backgroundColor = [UIColor clearColor];
        view.layer.borderColor = [UIColor blackColor].CGColor;
        view.layer.borderWidth = 1.0;
        view;
    });
    
    [self.view addSubview:thirdView];
    [self.view addSubview:fourthView];
    
//    UIBezierPath *firstPath = ({
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(SCREEN_SIZE.width * 0.15 + 3, SCREEN_SIZE.height * 0.85, SCREEN_SIZE.width * 0.7 - 6, 3)];
//        [[UIColor purpleColor] setStroke];
//        [[UIColor purpleColor] setFill];
//        path.lineWidth = 1.0;
//        path;
//    });
//    [firstPath fill];
//    [firstPath stroke];
//    
//    UIBezierPath *secondPath = ({
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(SCREEN_SIZE.width * 0.15 + 6, SCREEN_SIZE.height * 0.85 + 3, SCREEN_SIZE.width * 0.7 - 12, 3)];
//        [[UIColor purpleColor] setStroke];
//        [[UIColor purpleColor] setFill];
//        path.lineWidth = 1.0;
//        path;
//    });
//    [secondPath fill];
//    [secondPath stroke];
    
    [self.view addSubview:secondView];
    [self.view addSubview:showView];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)];
    [showView addGestureRecognizer:pan];
}

- (void)dragView:(UIPanGestureRecognizer *)gesture {
    CGPoint offset = [gesture translationInView:self.view];
    UIView *showView = [self.view viewWithTag:100];
    if (gesture.state == UIGestureRecognizerStateChanged) {
//        [showView setCenter:CGPointMake(showView.center.x + offset.x, showView.center.y + offset.y)];
//        [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
        
        [self rotateAnimationWithView:showView offset:offset];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        if (offset.x > showView.center.x && offset.x - showView.center.x > 30) {
            NSLog(@"Delete");
            
        } else if (offset.x < showView.center.x && showView.center.x - offset.x > 30) {
            NSLog(@"Add");
        } else {
            NSLog(@"Cancel all operation.");
        }
    }
}

- (void)rotateAnimationWithView:(UIView *)view offset:(CGPoint)offset {
    view.transform = CGAffineTransformMakeRotation(-M_PI_2 / 3);
    view.transform = CGAffineTransformTranslate(view.transform, -500, 200);
    view.alpha = 0.5;
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformIdentity;
        view.alpha = 1;
    }];
}

- (void)loadTableView {
    self.tableview = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"4", @"5", @"6", nil];
    self.mainArray = [NSMutableArray arrayWithObjects:array1, array2, nil];
}

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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Section = %@, row = %@", @(indexPath.section), @(indexPath.row));
        [self.mainArray[indexPath.section] removeObjectAtIndex:indexPath.row];
        NSLog(@"Section = %@, row = %@", @(indexPath.section), @(indexPath.row));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
