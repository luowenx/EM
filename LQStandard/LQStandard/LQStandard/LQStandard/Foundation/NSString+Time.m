//
//  NSString+Time.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/26.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

+(NSString *)stringFormatIntervalSince1970:(double)interval formatString:(NSString *)formatString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval]];
    return  currentDateStr;
}

+ (NSString *)stringFormatIntervalSince1970_YearMonthDayHourMinuteSecond_Line:(double)interval
{
    return [NSString stringFormatIntervalSince1970:interval formatString:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)stringFormatIntervalSince1970_YearMonthDayHourMinute_Line:(double)interval
{
    return [NSString stringFormatIntervalSince1970:interval formatString:@"yyyy-MM-dd HH:mm"];
}

+ (NSString *)stringFormatIntervalSince1970_MonthDayHourMinute_Slash:(double)interval
{
    return [NSString stringFormatIntervalSince1970:interval formatString:@"MM/dd HH:mm"];
}

+ (NSString *)stringFormatIntervalSince1970_HourMinute_colon:(double)interval
{
    return [NSString stringFormatIntervalSince1970:interval formatString:@"HH:mm"];
}

+ (NSString *)stringFormatIntervalSince1970_MonthDay_Slash:(double)interval
{
    return [NSString stringFormatIntervalSince1970:interval formatString:@"MM/dd"];
}



@end
