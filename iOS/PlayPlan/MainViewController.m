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
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Drawer" style:UIBarButtonItemStylePlain target:self action:@selector(showDrawer)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)showDrawer {
    NSLog(@"Show drawer.");
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
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:keyWindow.frame];
    
    
    [self.tableview drawViewHierarchyInRect:keyWindow.frame afterScreenUpdates:YES];
    image.image = [self blurryImage:[self snapshot] withBlurLevel:0.3];
    
    [overlay addSubview:image];
    
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

//- (UIImage *)snapshot
//{
//    CGSize size = self.view.frame.size;
//    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
//    [[UIApplication sharedApplication].keyWindow drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
//    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    CGSize size2 = self.view.frame.size;
//    // 看这里，看这里
//    if (fabs(size.height - size2.height) > 0.0001 || fabs(size.width - size2.width) > 0.0001) {
//        UIGraphicsBeginImageContextWithOptions(size2, NO, [UIScreen mainScreen].scale);
//        [[UIApplication sharedApplication].keyWindow drawViewHierarchyInRect:self.view.frame afterScreenUpdates:YES];
//        snap = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//    }
//    
//    return snap;
//}

//- (void)dragView:(UIPanGestureRecognizer *)pan {
//    CGPoint offset = [pan translationInView:self.view];
//    CGFloat moveHeight = offset.y - pan.view.center.y;
//    if (pan.view) {
//        pan.view.transform = CGAffineTransformMakeTranslation(0, offset.y);
////        [pan setTranslation:CGPointZero inView:self.view];
//    }
//}

//- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
//    if ((blur < 0.0f) || (blur > 1.0f)) {
//        blur = 0.5f;
//    }
//    
//    int boxSize = (int)(blur * 100);
//    boxSize -= (boxSize % 2) + 1;
//    
//    CGImageRef img = image.CGImage;
//    
//    vImage_Buffer inBuffer, outBuffer;
//    vImage_Error error;
//    void *pixelBuffer;
//    
//    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
//    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
//    
//    inBuffer.width = CGImageGetWidth(img);
//    inBuffer.height = CGImageGetHeight(img);
//    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    
//    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
//    
//    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
//    
//    outBuffer.data = pixelBuffer;
//    outBuffer.width = CGImageGetWidth(img);
//    outBuffer.height = CGImageGetHeight(img);
//    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
//    
//    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL,
//                                       0, 0, boxSize, boxSize, NULL,
//                                       kvImageEdgeExtend);
//    
//    
//    if (error) {
//        NSLog(@"error from convolution %ld", error);
//    }
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef ctx = CGBitmapContextCreate(
//                                             outBuffer.data,
//                                             outBuffer.width,
//                                             outBuffer.height,
//                                             8,
//                                             outBuffer.rowBytes,
//                                             colorSpace,
//                                             CGImageGetBitmapInfo(image.CGImage));
//    
//    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
//    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
//    
//    //clean up
//    CGContextRelease(ctx);
//    CGColorSpaceRelease(colorSpace);
//    
//    free(pixelBuffer);
//    CFRelease(inBitmapData);
//    
//    CGColorSpaceRelease(colorSpace);
//    CGImageRelease(imageRef);
//    
//    return returnImage;
//}

//- (void)tap:(UIControl *)tap {
//    UIView *view = [[UIView new] viewWithTag:'view'];
//    [UIView animateWithDuration:0.5 animations:^{
//        view.transform = CGAffineTransformMakeTranslation(0, SCREEN_SIZE.height / 2);
//    } completion:^(BOOL finished) {
//        [tap.superview removeFromSuperview];
//        [tap removeFromSuperview];
//        [view removeFromSuperview];
//    }];
//    
//    NSLog(@"tap");
//}

@end
