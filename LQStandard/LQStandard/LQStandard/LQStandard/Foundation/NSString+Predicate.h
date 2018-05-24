//
//  NSString+Predicate.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/13.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum RegexType{
    isNill,
    isError,
    isRight
}RegexType;

@interface NSString (Predicate)

/**
 截取字符串
 @note 所有的字符都是按照1个单位计算.
 */
- (instancetype)stringByCutingToIndex:(NSUInteger)index;
- (instancetype)stringByCutingToIndex:(NSUInteger)index range:(NSRange)range;

/**
 包含emoji的字符串长度
 @note emoji长度算作1个单位
 */
- (NSUInteger)stringByCalculatingStringLength;

//电话号码限制
+ (RegexType)validateTel:(NSString *)candidate;

@end
