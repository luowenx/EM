//
//  EMRankListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 排行榜
 */
@interface EMRankListReq : LQHttpRequest
@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;

@end

@interface EMRankListRes : LQHttpResponse
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray * list;
@end
/*
 [0]    (null)    @"pageId" : (long)1
 [1]    (null)    @"pageSize" : (long)20
 [2]    (null)    @"totalCount" : (long)100
 [3]    (null)    @"maxPageId" : (long)5
 [4]    (null)    @"msg" : @"成功"
 [5]    (null)    @"list" : @"20 elements"
 [6]    (null)    @"ret" : (long)0
 */
