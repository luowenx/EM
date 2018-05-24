//
//  LQHttpRequest.h
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQHttpResponse.h"

/**
 乐趣专用请求类
 */
@protocol IHttpResponseProtocol;
@interface LQHttpRequest : NSObject<IHttpResponseProtocol>

//限制类型 默认kHTTPRequestLimitTypeAuthentication
@property (nonatomic, assign) HTTPRequestLimitType limitType;
// 需要添加的请求头
@property (nonatomic, strong) NSDictionary *headerValues;

//自定义请求域名
@property (nonatomic, copy) NSString *hostUrl;

//默认 HTTPRequstMethodGet；
@property (nonatomic, assign) HTTPRequstMethod method;

// 是否缓存、默认NO
@property (nonatomic) BOOL isNeedCache;

//相对url地址
@property (nonatomic, strong) NSString *relativeUrl;

//参数集
@property (nonatomic, readonly) NSDictionary *parameters;

//参数串
@property (nonatomic, readonly) NSString *parametersPairsValue;

/**
 某些get请求拼接参数
 
 @param apendStr 要拼接的参数
 */
- (void)apendRelativeUrlWith:(NSString *)apendStr;

/**
 统一的网络请求方式
 
 @param completionBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)requestWithCompletion:(HTTPSuccessBlock)completionBlock error:(HTTPErrorBlock)errorBlock;

/**
 取消该网络请求
 */
- (void)cancel;


-(NSString *)urlString;
@end
