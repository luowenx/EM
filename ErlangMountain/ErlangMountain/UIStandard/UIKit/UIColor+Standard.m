//
//  UIColor+Standard.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/11.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "UIColor+Standard.h"

#define MCColorImplement(COLOR_NAME,RED,GREEN,BLUE)    \
+ (UIColor *)COLOR_NAME{    \
static UIColor* COLOR_NAME##_color;    \
static dispatch_once_t COLOR_NAME##_onceToken;   \
dispatch_once(&COLOR_NAME##_onceToken, ^{    \
COLOR_NAME##_color = [UIColor colorWithRed:(float)RED/255 green:(float)GREEN/255 blue:(float)BLUE/255 alpha:1.0];  \
});\
return COLOR_NAME##_color;  \
}

@implementation UIColor (Standard)

MCColorImplement(flsMainColor, 0xff, 0x30, 0x30)

MCColorImplement(flsMainColor2, 0xf0, 0x80, 0x80)

MCColorImplement(flsMainColor3, 0x7d, 0x58, 0x20)

MCColorImplement(flsDelayColor, 0xf7, 0xb5, 0x6e)

MCColorImplement(flsCancelColor, 0x99, 0x99, 0x99)

MCColorImplement(flsSpaceLineColor, 0xed, 0xed, 0xed)


@end
