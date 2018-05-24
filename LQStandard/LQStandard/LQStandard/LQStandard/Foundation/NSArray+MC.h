//
//  NSArray+MC.h
//  MCCore
//
//  Created by zhangyu on 15-5-28.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<__covariant ObjectType> (MC)

- (ObjectType)safeObjectAtIndex:(NSInteger)index;



- (NSArray *)safeSubarrayWithRange:(NSRange)range;

- (NSArray *)head:(NSUInteger)count;

@end

@interface NSMutableArray<ObjectType> (MC)

- (void)safeAddObject:(ObjectType)aObj;
- (void)safeRemoveObjectAtIndex:(NSInteger)index;

@end