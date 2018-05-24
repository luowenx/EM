//
//  UIColor+Standard.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/11.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

//颜色值
#define lqColor255(x,y,z)       lqColor255a(x,y,z,1.0f)
//颜色值
#define lqColor255a(x,y,z,a)    [UIColor colorWithRed:(float)x/255.0f green:(float)y/255.0f blue:(float)z/255.0f alpha:a]

//eg:0xFFFFFF代表白色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define UIColorFromRGBA(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF000000) >> 24))/255.0 \
green:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 \
blue:((float)((rgbaValue & 0xFF00) >> 8))/255.0 \
alpha:((float)(rgbaValue & 0xFF))/255.0]

@interface UIColor (Standard)

// 主题色 1   ff3030
+(UIColor *)flsMainColor;

//  主题色 2
+(UIColor *)flsMainColor2;

//  主题色 3
+(UIColor *)flsMainColor3;

// 线条灰色  ededed
+(UIColor *)flsSpaceLineColor;

//  f7b56e
+(UIColor *)flsDelayColor;

// 999999
+(UIColor *)flsCancelColor;
@end
