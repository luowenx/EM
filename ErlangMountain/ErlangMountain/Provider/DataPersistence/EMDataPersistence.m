//
//  EMDataPersistence.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMDataPersistence.h"

@interface EMDataPersistence ()

@property (nonatomic, strong, readwrite) NSMutableArray *container;

@end

@implementation EMDataPersistence

+(instancetype)sharePersistence
{
    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _container = [NSMutableArray array];
        NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfFile:[[self class] persistencePath]];
        if (infoDic) {
            [self persistenceObjWithDic:infoDic];
        }
    }
    return self;
}

- (void)persistenceObjWithDic:(NSDictionary*)localDic
{
    if (localDic.count == 0) {
        return;
    }
    
}

- (BOOL)persistence
{
    NSDictionary *userDic = self.toJSON;
    if (userDic.count == 0) {
        return NO;
    }
    return [userDic writeToFile:[[self class] persistencePath] atomically:YES];
}

-(BOOL)clear
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[[self class] persistencePath]]) {
        return [[NSFileManager defaultManager] removeItemAtPath:[[self class] persistencePath] error:NULL];
    }
    return NO;
}

+ (NSString *)persistencePath
{
    return @"";
}

#pragma mark ===  LQEncode
-(NSDictionary *)toJSON
{
    return nil;
}


@end

@implementation EMDataPersistence(Container)

-(void)insertObj:(id)inserter compareKey:(NSString *)key
{
    if (key.length == 0) {
        return;
    }
    
    if ([self.container containsObject:inserter]) {
        return;
    }
    __block BOOL add = YES;
    [self.container enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[[obj valueForKey:key] asNSString] isEqualToString:[[inserter valueForKey:key] asNSString]]) {
            [self.container removeObject:obj];
            add = NO;
            *stop = YES;
        }
    }];
    
    if (add) {
        [self.container addObject:inserter];
        [self persistence];
    }
    
}

-(void)deleteObj:(id)deleter compareKey:(NSString *)key
{
    if (key.length == 0) {
        return;
    }
    
    __block BOOL delete = NO;
    
    if ([self.container containsObject:deleter]) {
        delete = YES;
        [self.container removeObject:deleter];
    }else{
        [self.container enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([[[obj valueForKey:key] asNSString] isEqualToString:[[deleter valueForKey:key] asNSString]]) {
                [self.container removeObject:obj];
                delete = YES;
                *stop = YES;
            }
        }];
    }
    
    if (delete) {
        [self persistence];
    }
}

-(void)synchroObj:(id)aObj  compareKey:(NSString *)key1  synchroKey:(NSString *)key2
{
    if (key1.length == 0 || key2.length ==0) {
        return;
    }
    
    [self.container enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[[obj valueForKey:key1] asNSString] isEqualToString:[[aObj valueForKey:key1] asNSString]]) {
            [aObj setValue:[obj valueForKey:key2] forKey:key2];
            *stop = YES;
        }
    }];
}

-(void)synchroObj:(id)aObj  compareKey:(NSString *)key
{
    if (key.length == 0) {
        return;
    }
    
    __block id synchroObj = nil;
    
    [self.container enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[[obj valueForKey:key] asNSString] isEqualToString:[[aObj valueForKey:key] asNSString]]) {
            synchroObj = obj;
            *stop = YES;
        }
    }];
    
    if (synchroObj) {
        aObj = synchroObj;
    }
}

@end


@implementation NSArray(EMDataPersistence)

-(NSArray *)toJSON
{
    if (![self isKindOfClass:[NSArray class]]) {
        return @[];
    }
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if ([obj respondsToSelector:@selector(toJSON)]) {
            id dic = [obj performSelector:@selector(toJSON)];
            if (dic) {
                [arr addObject:dic];
            }
        }
    }
    return arr.copy;
}

@end
