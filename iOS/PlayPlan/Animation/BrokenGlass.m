//
//  BrokenGlass.m
//  PlayPlan
//
//  Created by Zeacone on 15/10/30.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#import "BrokenGlass.h"

@implementation BrokenGlass

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareForBrokenLayer];
    }
    return self;
}

/**
 *  Seprate view into some layers.
 */
- (void)prepareForBrokenLayer {
    NSMutableArray *layers = [NSMutableArray array];
    
    for (NSInteger x = 0; x < 20; x++) {
        for (NSInteger y = 0; y < 40; y++) {
            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        }
    }
    
    for (CAShapeLayer *layer in layers) {
        [self.layer addSublayer:layer];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
