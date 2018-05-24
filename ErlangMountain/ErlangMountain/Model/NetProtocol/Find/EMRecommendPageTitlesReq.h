//
//  EMRecommendPageTitlesReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"


/**
 推荐更多滚动标题
 */
@interface EMRecommendPageTitlesReq : LQHttpRequest

@property (nonatomic) NSInteger categoryId;

@property (nonatomic, copy) NSString *contentType;

@end

@interface EMRecommendPageTitlesRes : LQHttpResponse
@property (nonatomic) BOOL hasRecommendedZones;
@property (nonatomic) BOOL isFinished_;
@property (nonatomic) NSInteger count;
@property (nonatomic, strong) NSDictionary * categoryInfo;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray * list;

@end

/*
 [0]    (null)    @"hasRecommendedZones" : (no summary)
 [1]    (null)    @"isFinished" : (no summary)
 [2]    (null)    @"count" : (long)18
 [3]    (null)    @"categoryInfo" : 6 key/value pairs
 [4]    (null)    @"maxPageId" : (long)1
 [5]    (null)    @"msg" : @"成功"
 [6]    (null)    @"list" : @"18 elements"
 [7]    (null)    @"ret" : (long)0
 */
