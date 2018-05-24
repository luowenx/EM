//
//  NSString+Predicate.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/13.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)

- (instancetype)stringByCutingToIndex:(NSUInteger)index {
    return [self stringByCutingToIndex:index range:NSMakeRange(0, self.length)];
}

- (instancetype)stringByCutingToIndex:(NSUInteger)index range:(NSRange)range {
    __block NSUInteger length = 0;
    __block NSMutableString *buffer = [NSMutableString string];
    
    [self enumerateSubstringsInRange:range
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              length ++;
                              [buffer appendString:substring];
                              if (length == index) {
                                  *stop = YES;
                              }
                          }];
    
    return [buffer stringByAppendingString:[self substringWithRange:NSMakeRange(range.length, self.length - range.length)]];
}

- (NSUInteger)stringByCalculatingStringLength {
    __block NSUInteger length = 0;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              length ++;
                          }];
    return length;
}

#pragma mark validateTel
+ (RegexType)validateTel:(NSString *) candidate {
    NSString *telRegex = @"^1[0-9]\\d{9}$";
    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    if ([telTest evaluateWithObject:candidate]) {
        return isRight;
    }else{
        return isError;
    }
}

@end
