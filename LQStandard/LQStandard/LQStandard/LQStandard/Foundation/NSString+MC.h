//
//  NSString+MC.h
//  MCCore
//
//  Created by zhangyu on 15-4-2.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MC)

#define MCDateFormatAll @"yyyy-MM-dd HH:mm:ss"
//把日期转换为当前时区的时间
- (NSDate *)dateWithFormat:(NSString *)aFormat; //@"yyyy-MM-dd"

//计算字符串的长度
- (NSInteger)unicodeSize;

+ (NSString *)conver2TimeString:(NSUInteger)aSec;
////特殊转移字符处理
+ (NSString *)encodeURLString:(NSString *)str;

//Byte数组－>16进制数
- (NSString *)hexStringFromData:(NSData *)aData;
- (NSData *)dataFromHexString;

//保留最多2位小数的字符串1.000 = "1",1.0101011=@"1.01",1.100000 = @"1.1"
+ (NSString *)stringWith2Float:(float)f;

//去掉前后和换行的空格
- (NSString *)pureString;
//转为以http开始的字符串
- (NSString *)URLString;

+ (NSStringEncoding)gbkEncoding;

//中文转换成拼音
- (NSString *)transformToPinyin;

//特殊转移字符处理
- (NSString *)encodeWithURLFormat;

- (id)jsonValue;

//bgk str
- (const char *)cGBKBytes;

/**
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */
- (BOOL)isValidIdentityCard;

-(NSString *)safeSubstringToIndex:(NSInteger)index;

@end
