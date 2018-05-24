//
//  EMDataPersistence.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 数据存储基类
 ！！！请勿直接使用
 */
@interface EMDataPersistence : NSObject<LQEncode>
// ----------------- public  ----------------- //
/** 持久化操作 */
- (BOOL)persistence;
/** 清除数据 */
- (BOOL)clear;

// ----------------- need to rewrite  ----------------- //
+ (instancetype)sharePersistence;
/** 根据本地字典解出本地数据对象 */
- (void)persistenceObjWithDic:(NSDictionary*)localDic;
/** 把需要持久化的对象转成字典 */
- (NSDictionary *)toJSON;
/** 本地持久化文件路径 */
+ (NSString *)persistencePath;

@end

@interface EMDataPersistence (Container)
//** 可使用容器，需要对container持久化 */
@property (nonatomic, strong, readonly) NSMutableArray *container;

/**
 插入一个对象并保存
 @param inserter 插入对象
 @param key 用于去重的key，对应的值应该是字符串类型
 */
-(void)insertObj:(id)inserter compareKey:(NSString *)key;
-(void)deleteObj:(id)deleter compareKey:(NSString *)key;

/**
 同步持久化对象
 @param aObj 需要同步的对象
 @param key1 查找是否需要同步，对应的值应该是字符串类型
 @param key2 需要同步的值对应的key
 */
-(void)synchroObj:(id)aObj  compareKey:(NSString *)key1  synchroKey:(NSString *)key2;
-(void)synchroObj:(id)aObj  compareKey:(NSString *)key;

@end


@interface NSArray (EMDataPersistence)

-(NSArray *)toJSON;

@end
