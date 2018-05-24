//
//  LQUserDefault.h
//  LQStandard
//
//  Created by lequwuxian1 on 2018/4/10.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQUserDefault : NSObject

// dont support bool
+ (id)readObjectForKey:(NSString *)key;

// defaultObject dont support bool,
+ (id)readObjectForKey:(NSString *)key defaultObject:(id)defaultObject;

+ (void)writeObject:(id)anObject forKey:(NSString *)key;
// if bSync == YES, run [[NSUserDefaults standardUserDefaults] synchronize],if AnObject is nil will remove the key
+ (void)writeObject:(id)anObject forKey:(NSString *)key synchronize:(BOOL)bSync;

// 设置默认的值
+ (void)registerDefaults:(NSDictionary *)dic;
+ (void)synchronize;

@end
