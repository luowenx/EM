//
//  UIDevice+LQ.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/2/7.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (LQ)

+ (NSString *)deviceModel;
+ (NSString *)deviceResolution;
+ (NSString *)deviceName;

// 是否retina屏
+ (BOOL)isRetina;

+ (BOOL)isDevicePhone;
+ (BOOL)isDevicePad;

+ (BOOL)requiresPhoneOS;

//如果是3.5寸屏
+ (BOOL)isScreen35;
+ (BOOL)isPhone;
+ (BOOL)isPhone35;
+ (BOOL)isPhoneRetina35;
+ (BOOL)isPhoneRetina4;
+ (BOOL)isPad;
+ (BOOL)isPadRetina;
+ (BOOL)isScreenSize:(CGSize)size;

@end
