//
//  EMFollowAnchorReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 关注主播
 请求主播详细信息
 */
@interface EMFollowAnchorReq : LQHttpRequest

@property (nonatomic) NSInteger toUid;

@end

@interface EMFollowAnchorRes : LQHttpResponse

@end
