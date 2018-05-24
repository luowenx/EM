//
//  LQHTTPClient.h
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LQProtocolDef.h"

@class LQHttpRequest;

/**
 异步网络请求

 @param bindObj 预留参数
 @param request 请求类
 @param compleBlock 成功回调
 @param errorBlock 失败回调
 */
void lq_Request(id bindObj, LQHttpRequest *request, HTTPSuccessBlock compleBlock, HTTPErrorBlock errorBlock);

/**
 *  取消指定request的请求(包括正在执行中的请求)
 *
 *  @param request 指定的request
 *
 */
void lq_CancelOpWithRequest(LQHttpRequest *request);

/**
 *  网络状况
 *
 *  @return 是否有效
 */
FOUNDATION_STATIC_INLINE BOOL lq_NetReachable(void);

@interface LQHTTPClient : AFHTTPSessionManager
+(instancetype)shareClient;

/**
 成功回调中处理ret
 ret  对应code
 callbackData 是否继续回调成功
 LQHttpError *  如果错误并且需的时候，请返回一个Error，会被回调
 */
@property (nonatomic, copy) LQHttpError * (^ret)(NSInteger ret,BOOL *callbackData);

@end
