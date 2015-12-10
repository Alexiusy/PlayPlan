//
//  Overlay.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/18.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayPlan.h"

typedef void(^clickOverlayHandler)(void);

@interface Overlay : UIView

@property (nonatomic, copy) clickOverlayHandler clickHandler;

+ (instancetype)sharedOverlay;
- (void)showView:(UIView *)subView On:(UIView *)superView WithBlur:(BOOL)blur Rect:(CGRect)rect;

@end
