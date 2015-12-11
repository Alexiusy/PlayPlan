//
//  LocationViewController.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/26.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NearbyViewController;

@protocol LocationDelegate <NSObject>

- (void)dismissLocationViewController:(NearbyViewController *)locationViewController;

@end

@interface NearbyViewController : UIViewController

@property (nonatomic, assign) id<LocationDelegate> delegate;

@end