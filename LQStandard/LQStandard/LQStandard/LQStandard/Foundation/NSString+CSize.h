//
//  NSString+CSize.h
//  haochang
//
//  Created by yuandaiyong on 14-7-25.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (CSize)

- (CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font;
- (CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font lineBreakMode:(NSLineBreakMode)mode;

+ (NSString *)formatNumberStringForKiloWithString:(NSString*)numberString;

+ (NSString *)formatNumberStringForChatWithString:(NSString*)numberString;

+ (NSString *)formatNumberStringWithNumberString:(NSString*)numberString;

+ (NSString *)formatNumberStringWithNSNumber:(NSNumber*)number;

+ (NSString *)formatNumberStringWithLongLong:(long long)number;

/**
 *  @brief  小于1G，显示为M，保留整数，不足1M显示上+1M
 *          大于等于1G，显示为G，保留一位小数
 *
 *  @param fileSize KB
 */
+ (NSString *)formatFileSizeStringWithDouble:(double)fileSize;

/**
 *  数值通用规则
 *
 *  四位数及以内的
 *  ·显示当前数值
 *  ·若有小数，显示两位小数
 *  ·超出部分省略
 *
 *  四位数以上
 *  ·显示单位为“万”
 *  ·有小数时处理：
 *  ·只有个位的显示两位小数，例如：原数值78360，显示为7.83万
 *  ·有十位时显示一位小数，例如：原数值783600，显示为78.3万
 *  ·有百位及其以上时不显示小数，例如：原数值7836000，显示为783万
 */
+ (NSString *)formatNumberStringWithInteger:(NSInteger)sourceNum;

@end
