//
//  LQNetDataCache.h
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 <#Description#>
 */
@interface LQNetDataCache : NSObject

/**
 获取缓存数据--同步

 @param url key
 @return 数据
 */
+(id)getDataWithKey:(NSString*)url;

/**
 获取缓存数据--异步

 @param url key
 @param block 回调
 */
+(void)getDataWithKey:(NSString *)url block:(void(^)(id cacheData))block;

/**
 设置缓存数据

 @param cachedata 数据
 @param url key
 */
+(void)setHttpData:(id)cachedata cacheKey:(NSString *)url;

/**
 获取缓存大小

 @return 大小M
 */
+ (CGFloat)getCacheSize;

/**
 清空缓存
 回阻塞线程
 */
+ (void)clear;

@end
