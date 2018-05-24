//
//  NSString+CSize.m
//  haochang
//
//  Created by yuandaiyong on 14-7-25.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import "NSString+CSize.h"

@implementation NSString (CSize)

- (CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font
{
    return [self getSizeWithConntainSize:size font:font lineBreakMode:NSLineBreakByWordWrapping];
}

-(CGSize)getSizeWithConntainSize:(CGSize)size font:(UIFont *)font lineBreakMode:(NSLineBreakMode)mode
{
    CGSize strSize = CGSizeZero;
    
    if(( [[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] != NSOrderedAscending )){
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineBreakMode = mode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        strSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }
//    else{
//        strSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:mode];
//    }
    
    return strSize;
}

+ (NSString *)formatNumberStringWithNumberString:(NSString*)numberString
{
    return [self formatNumberStringWithLongLong:numberString.longLongValue];
}

+ (NSString *)formatNumberStringWithNSNumber:(NSNumber*)number
{
    return [self formatNumberStringWithLongLong:number.longLongValue];
}

+ (NSString *)formatNumberStringWithLongLong:(long long)number
{
    NSString *tmpNumString = @"";
    
    if (number >= 100*10000)
    {
        //不保留小数点 （eg:1234W 543W）
        CGFloat displayNumber = number/10000;
        if (displayNumber >= 10000) {
            
            tmpNumString = @"9999w";
        } else {
            
            tmpNumString = [NSString stringWithFormat:@"%.0fw",displayNumber];
        }
        
    } else if(number > 99999) {
        //保留小数点一位 (eg:20.3W)，不四舍五入,直接截断
        CGFloat displayNumber = number/10000.0f;
        CGFloat decimalNeedToAbandon = (number / 1000.0f - (long long)(number / 1000)) / 10.0f;
        displayNumber -= decimalNeedToAbandon;
        tmpNumString = [NSString stringWithFormat:@"%.1fw",displayNumber];
    } else {
        //(eg:12345 123)
        tmpNumString = [NSString stringWithFormat:@"%lld",number];
    }
    tmpNumString=[tmpNumString stringByReplacingOccurrencesOfString:@".0w" withString:@"w"];
    return tmpNumString;
}

+ (NSString *)formatNumberStringForKiloWithString:(NSString*)numberString
{
    NSString *tmpNumString = @"";
    long long number = numberString.longLongValue;
    
    if(number > 999) {
        //保留小数点一位 (eg:20.3k)
        CGFloat displayNumber = number/1000.0f;
        
        tmpNumString = [NSString stringWithFormat:@"%.1fk",displayNumber];
    }
    
    tmpNumString=[tmpNumString stringByReplacingOccurrencesOfString:@".0k" withString:@"k"];
    return tmpNumString;
}

+ (NSString *)formatNumberStringForChatWithString:(NSString *)numberString {
    NSString *tmpNumString = @"";
    long long number = numberString.longLongValue;
    
    if(number > 999) {
        tmpNumString = @"999+";
    } else {
        tmpNumString = numberString;
    }
    
    return tmpNumString;
}

+ (NSString *)formatFileSizeStringWithDouble:(double)fileSize
{
    fileSize = fileSize/1024/1024;// 转化为 M
    
    if (fileSize > -0.00001 && fileSize < 0.00001) {
        // 文件大小为 0
        return @"0M";
    }
    
    NSString *strFileSize;
    if (fileSize >= 1024) {
        
        fileSize    = fileSize/1024;
        // 保留一位小数
        strFileSize = [NSString stringWithFormat:@"%0.1fG", fileSize];
    } else {
        
        // 向上取整
        fileSize = ceil(fileSize);
        
        strFileSize = [NSString stringWithFormat:@"%dM", (int)fileSize];
    }
    
    return strFileSize;
}

+ (NSString *)formatNumberStringWithInteger:(NSInteger)sourceNum
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingMode = NSNumberFormatterRoundFloor;
    
    if (sourceNum < 10000) {
        NSNumber *number = [NSNumber numberWithInteger:sourceNum];
        formatter.maximumFractionDigits = 2;
        return [NSString stringWithFormat:@"%@", [formatter stringFromNumber:number]];
    } else {
        if (sourceNum / 10000 < 10) {
            NSNumber *number = [NSNumber numberWithDouble:sourceNum / 10000.0];
            formatter.maximumFractionDigits = 2;
            return [NSString stringWithFormat:(@"%@万"), [formatter stringFromNumber:number]];
        } else if (sourceNum / 10000 < 100) {
            NSNumber *number = [NSNumber numberWithDouble: sourceNum / 10000.0];
            formatter.maximumFractionDigits = 1;
            return [NSString stringWithFormat:(@"%@万"), [formatter stringFromNumber:number]];
        } else {
            NSNumber *number = [NSNumber numberWithDouble: sourceNum / 10000.0];
            formatter.maximumFractionDigits = 0;
            return [NSString stringWithFormat:(@"%@万"), [formatter stringFromNumber:number]];
        }
    }
}
@end
