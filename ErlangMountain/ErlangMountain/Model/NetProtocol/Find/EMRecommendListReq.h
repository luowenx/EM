//
//  EMRecommendListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/19.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 发现 -- 推荐新奇
 */
@interface EMRecommendListReq : LQHttpRequest

@end


@interface EMRecommendListRes : LQHttpResponse
// focusImages {list:[]}
@property (nonatomic, strong) NSDictionary *focusImages;
// hotRecommends {list : []}
@property (nonatomic, strong) NSDictionary * hotRecommends;

@end
