//
//  NSObject+LQ.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/24.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "NSObject+LQ.h"

@implementation NSObject (LQ)

#pragma mark - Conversion
- (NSInteger)asInteger
{
    return [[self asNSNumber] integerValue];
}

- (float)asFloat
{
    return [[self asNSNumber] floatValue];
}

- (BOOL)asBool
{
    return [[self asNSNumber] boolValue];
}

- (NSNumber *)asNSNumber
{
    if ( [self isKindOfClass:[NSNumber class]] )
    {
        return (NSNumber *)self;
    }
    else if ( [self isKindOfClass:[NSString class]] )
    {
        return [NSNumber numberWithInteger:[(NSString *)self integerValue]];
    }
    else if ( [self isKindOfClass:[NSDate class]] )
    {
        return [NSNumber numberWithDouble:[(NSDate *)self timeIntervalSince1970]];
    }
    else if ( [self isKindOfClass:[NSNull class]] )
    {
        return [NSNumber numberWithInteger:0];
    }
    
    return nil;
}

- (NSString *)asNSString
{
    if ( [self isKindOfClass:[NSNull class]] )
        return nil;
    
    if ( [self isKindOfClass:[NSString class]] )
    {
        return (NSString *)self;
    }
    else if ( [self isKindOfClass:[NSData class]] )
    {
        NSData * data = (NSData *)self;
        return [[NSString alloc] initWithBytes:data.bytes length:data.length encoding:NSUTF8StringEncoding];
    }
    else
    {
        return [NSString stringWithFormat:@"%@", self];
    }
}


- (NSArray *)asNSArray
{
    if ( [self isKindOfClass:[NSArray class]] )
    {
        return (NSArray *)self;
    }
    else
    {
        return [NSArray arrayWithObject:self];
    }
}

- (NSMutableArray *)asNSMutableArray
{
    if ( [self isKindOfClass:[NSMutableArray class]] )
    {
        return (NSMutableArray *)self;
    }
    
    return nil;
}

- (NSDictionary *)asNSDictionary
{
    if ( [self isKindOfClass:[NSDictionary class]] )
    {
        return (NSDictionary *)self;
    }
    
    return nil;
}

- (NSMutableDictionary *)asNSMutableDictionary
{
    if ( [self isKindOfClass:[NSMutableDictionary class]] )
    {
        return (NSMutableDictionary *)self;
    }
    
    NSDictionary * dict = [self asNSDictionary];
    if ( nil == dict )
        return nil;
    
    return [NSMutableDictionary dictionaryWithDictionary:dict];
}

- (NSString *)jsonString
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self toJSONData:self];
    if (jsonData) {
        
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (NSData *)toJSONData:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (jsonData.length > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

@end
