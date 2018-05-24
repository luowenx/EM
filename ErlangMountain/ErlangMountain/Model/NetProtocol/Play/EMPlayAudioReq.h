//
//  EMPlayAudioReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

/**
 播放页主播信息
 */
@interface EMPlayAudioReq : LQHttpRequest

@property (nonatomic, copy) NSString * trackId;

@end

@interface EMPlayAudioRes : LQHttpResponse

@end
