//
//  EMAnchorAlbumListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 主播专辑列表
 */
@interface EMAnchorAlbumListReq : LQHttpRequest

@end

@interface EMAnchorAlbumListRes : LQHttpResponse
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic, strong) NSArray * list;
@end
