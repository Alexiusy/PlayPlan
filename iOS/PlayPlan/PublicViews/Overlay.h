//
//  Overlay.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/18.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayPlan.h"

@interface Overlay : UIView

+ (instancetype)sharedOverlay;
- (void)showView:(UIView *)subView On:(UIView *)superView WithBlur:(BOOL)blur Rect:(CGRect)rect;

@end
