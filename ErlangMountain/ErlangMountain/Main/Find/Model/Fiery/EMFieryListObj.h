//
//  EMFieryListObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主播列表对象
 */
@class EMAnchor;
@interface EMFieryListObj : NSObject<LQDecode, LQDataTransformation>

@property (nonatomic) NSInteger id;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) NSArray <EMAnchor *>* list;

@end

/*
 [0]    (null)    @"id" : (long)0
 [1]    (null)    @"title" : @"热门"
 [2]    (null)    @"list" : @"3 elements"
 [3]    (null)    @"name" : @"all"
 */
