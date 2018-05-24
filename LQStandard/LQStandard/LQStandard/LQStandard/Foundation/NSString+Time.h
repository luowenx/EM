//
//  NSString+Time.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/26.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 时间转换
 */
@interface NSString (Time)
+(NSString *)stringFormatIntervalSince1970:(double)interval formatString:(NSString *)formatString;

//输出格式为：2010-10-27 10:22:59
+ (NSString *)stringFormatIntervalSince1970_YearMonthDayHourMinuteSecond_Line:(double)interval;

//输出格式为：2010-10-27 10:22
+ (NSString *)stringFormatIntervalSince1970_YearMonthDayHourMinute_Line:(double)interval;

// 输出格式为：10/27 10:22
+ (NSString *)stringFormatIntervalSince1970_MonthDayHourMinute_Slash:(double)interval;

// 输出格式为：10:27
+ (NSString *)stringFormatIntervalSince1970_HourMinute_colon:(double)interval;

//输出格式为：10/27
+ (NSString *)stringFormatIntervalSince1970_MonthDay_Slash:(double)interval;

@end
