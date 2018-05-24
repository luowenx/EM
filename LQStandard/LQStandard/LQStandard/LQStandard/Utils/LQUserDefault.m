//
//  LQUserDefault.m
//  LQStandard
//
//  Created by lequwuxian1 on 2018/4/10.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQUserDefault.h"

@implementation LQUserDefault

+ (id)readObjectForKey:(NSString *)key
{
    return [self readObjectForKey:key defaultObject:nil];
}
+ (id)readObjectForKey:(NSString *)key defaultObject:(id)defaultObject
{
    id tempObject = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if (tempObject)
    {
        return tempObject;
    }else if (defaultObject)
    {
        return defaultObject;
    }
    else
    {
        return nil;
    }
}

+ (void)writeObject:(id)anObject forKey:(NSString *)key synchronize:(BOOL)bSync
{
    if (anObject == nil)
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:anObject forKey:key];
    }
    
    if (bSync)
    {
        [self synchronize];
    }
}
+ (void)writeObject:(id)anObject forKey:(NSString *)key
{
    [self writeObject:anObject forKey:key synchronize:YES];
}
+ (void)registerDefaults:(NSDictionary *)dic
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:dic];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)synchronize
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
