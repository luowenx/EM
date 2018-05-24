//
//  EMHotRecommendObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 热门数据对象
 */
@class EMRecommendItem;
@interface EMHotRecommendObj : NSObject<LQDecode, LQDataTransformation>
@property (nonatomic) BOOL hasMore;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy) NSString * title;
@property (nonatomic) BOOL isFinished_;
@property (nonatomic) NSInteger categoryId;
@property (nonatomic) NSInteger count;
@property (nonatomic, strong) NSArray <EMRecommendItem *> *list;
@property (nonatomic) EMCategoryType categoryType;
@end

/*
 [0]    (null)    @"hasMore" : (no summary)
 [1]    (null)    @"contentType" : @"album"
 [2]    (null)    @"title" : @"听小说"
 [3]    (null)    @"isFinished" : (no summary)
 [4]    (null)    @"categoryId" : (long)3
 [5]    (null)    @"count" : (long)1000
 [6]    (null)    @"list" : @"3 elements"
 [7]    (null)    @"categoryType" : (long)0
 */
