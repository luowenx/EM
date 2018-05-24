//
//  LQNetDataCache.m
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQNetDataCache.h"
#import "YYCache.h"

NSString *const __kLQNetDataCache = @"LQNetData.cache";
static YYCache *_netDataCache;

@implementation LQNetDataCache

+ (void)initialize
{
    _netDataCache = [YYCache cacheWithName:__kLQNetDataCache];
}

+(void)setHttpData:(id)cachedata cacheKey:(NSString *)url
{
    [_netDataCache setObject:cachedata forKey:url];
}

+(id)getDataWithKey:(NSString*)url;
{
    return [_netDataCache objectForKey:url];
}

+(void)getDataWithKey:(NSString *)url block:(void(^)(id cacheData))block
{
    [_netDataCache objectForKey:url withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nonnull object) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(object);
        });
    }];
}

+ (CGFloat)getCacheSize
{
    return [_netDataCache.diskCache totalCost]/1024.0/1024.0;
}

+ (void)clear
{
    [_netDataCache.diskCache removeAllObjects];
}

@end
