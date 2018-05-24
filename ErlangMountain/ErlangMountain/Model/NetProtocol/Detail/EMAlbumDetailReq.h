//
//  EMAlbumDetailReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 专辑详情
 */
@interface EMAlbumDetailReq : LQHttpRequest

@end

@interface EMAlbumDetailRes : LQHttpResponse

@property (nonatomic, strong) NSDictionary * album;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic) NSInteger  pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@end

/*
 ----- >>>  tracks  <<<<<< -----
 [0]    (null)    @"maxPageId" : (long)40
 [1]    (null)    @"list" : @"20 elements"
 [2]    (null)    @"pageId" : (long)1
 [3]    (null)    @"pageSize" : (long)20
 [4]    (null)    @"totalCount" : (long)791
 */
