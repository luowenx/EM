//
//  EMPeakListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 发现 -- 巅峰榜单
 */
@interface EMPeakListReq : LQHttpRequest

@end

@interface EMPeakListRes : LQHttpResponse
// focusImages {list:[]}
@property (nonatomic, strong) NSDictionary *focusImages;

@property (nonatomic, strong) NSArray * datas;

@end

