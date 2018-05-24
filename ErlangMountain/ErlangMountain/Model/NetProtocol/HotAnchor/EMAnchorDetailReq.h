//
//  EMAnchorDetailReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 主播详细信息
 */
@interface EMAnchorDetailReq : LQHttpRequest

@property (nonatomic) NSInteger toUid;

@end

@interface EMAnchorDetailRes : LQHttpResponse

@end
