//
//  NSArray+MC.m
//  MCCore
//
//  Created by zhangyu on 15-5-28.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "NSArray+MC.h"

@implementation NSArray (MC)

- (instancetype)safeObjectAtIndex:(NSInteger)index
{
    if ( index < 0 )
        return nil;
    
    if ( index >= self.count )
        return nil;
    
    return [self objectAtIndex:index];
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range
{
    if ( 0 == self.count )
        return nil;
    
    if ( range.location >= self.count )
        return nil;
    
    if ( range.location + range.length > self.count )
        return nil;
    
    return [self subarrayWithRange:NSMakeRange(range.location, range.length)];
}


- (NSArray *)head:(NSUInteger)count
{
    if ( [self count] < count )
    {
        return self;
    }
    else
    {
        NSMutableArray * tempFeeds = [NSMutableArray array];
        for ( NSObject * elem in self )
        {
            [tempFeeds addObject:elem];
            if ( [tempFeeds count] >= count )
                break;
        }
        
        return tempFeeds;
    }
}


@end

@implementation NSMutableArray (MC)

- (void)safeAddObject:(id)aObj
{
    if (aObj == nil) {
        return;
    }
    [self addObject:aObj];
}

- (void)safeRemoveObjectAtIndex:(NSInteger)index
{
    if ( index < 0 )
        return;
    
    if ( index >= self.count )
        return;
    
    [self removeObjectAtIndex:index];
}

@end
