//
//  LocationViewController.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/26.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationViewController;

@protocol LocationDelegate <NSObject>

- (void)dismissLocationViewController:(LocationViewController *)locationViewController;

@end

@interface LocationViewController : UIViewController

@property (nonatomic, assign) id<LocationDelegate> delegate;

@end