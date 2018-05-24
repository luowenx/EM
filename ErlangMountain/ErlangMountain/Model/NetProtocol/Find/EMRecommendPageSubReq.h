//
//  EMRecommendPageSubReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 推荐更多子页数据
 */
@interface EMRecommendPageSubReq : LQHttpRequest

@property (nonatomic) NSInteger categoryId;

@property (nonatomic) NSInteger pageId;

@property (nonatomic, copy) NSString * tagName;

@end

@interface EMRecommendPageSubRes : LQHttpResponse
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic, strong) NSArray *subfields;
@property (nonatomic, copy) NSString * title;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray *list;

@end

/*
 [0]    (null)    @"pageId" : (long)1
 [1]    (null)    @"pageSize" : (long)20
 [2]    (null)    @"totalCount" : (long)1000
 [3]    (null)    @"subfields" : @"0 elements"
 [4]    (null)    @"title" : @"热门"
 [5]    (null)    @"maxPageId" : (long)50
 [6]    (null)    @"msg" : @"成功"
 [7]    (null)    @"list" : @"20 elements"
 [8]    (null)    @"ret" : (long)0
 */
