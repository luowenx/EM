//
//  NSObject+LQ.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/24.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LQ)

#pragma mark - Conversion
- (NSInteger)asInteger;
- (float)asFloat;
- (BOOL)asBool;

- (NSNumber *)asNSNumber;
- (NSString *)asNSString;
- (NSArray *)asNSArray;

- (NSMutableArray *)asNSMutableArray;

- (NSDictionary *)asNSDictionary;
- (NSMutableDictionary *)asNSMutableDictionary;

- (NSString *)jsonString;

@end
