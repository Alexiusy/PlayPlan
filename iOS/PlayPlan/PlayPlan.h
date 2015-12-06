//
//  PlayPlan.h
//  PlayPlan
//
//  Created by Zeacone on 15/11/7.
//  Copyright © 2015年 Zeacone. All rights reserved.
//

#ifndef PlayPlan_h
#define PlayPlan_h

#import "Overlay.h"
#import "ZYToolBars.h"
#import "Transitions.h"

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
// 十六进制的每一位占用四位二进制，右移的位数根据二进制来判断
#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGB(red, green, blue) [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:1.0]

#endif /* PlayPlan_h */
