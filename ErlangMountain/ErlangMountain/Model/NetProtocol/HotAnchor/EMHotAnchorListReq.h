//
//  EMHotAnchorListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 火热主播
 */
@interface EMHotAnchorListReq : LQHttpRequest

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString * condition;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSInteger per_page;

@end

@interface EMHotAnchorListRes : LQHttpResponse
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray * list;
@end
