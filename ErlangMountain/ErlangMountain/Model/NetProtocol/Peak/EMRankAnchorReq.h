//
//  EMRankAnchorReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 主播排行
 */
@interface EMRankAnchorReq : LQHttpRequest

@property (nonatomic, copy) NSString *key;
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;

@end

@interface EMRankAnchorRes : LQHttpResponse

@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray * list;

@end
