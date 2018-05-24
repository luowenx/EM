//
//  LQHTTPClient.m
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQHTTPClient.h"

#import "LQHttpError.h"
#import "LQHttpRequest.h"
#import "LQHttpResponse.h"
#import "LQNetDataCache.h"
#import "AFNetworkActivityIndicatorManager.h"

NSString * lq_StrUTF8Encoding(NSString *str) {
    /*! ios9适配的话 打开第一个 */
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0) {
        return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:str]];
    } else  {
        return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}

@interface LQHTTPClient ()

// 发起对象与request 映射表
@property (nonatomic, strong) NSMapTable *object_RequestAtMapTable;

@end

static LQHTTPClient *_shareClient = nil;
@implementation LQHTTPClient

+(instancetype)shareClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [LQHTTPClient manager];
        _shareClient.requestSerializer.timeoutInterval = 10;
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        _shareClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/css", @"text/xml", @"text/plain", @"application/javascript", @"application/x-www-form-urlencoded", @"image/*", nil];
        
        [_shareClient.reachabilityManager startMonitoring];

        [_shareClient setupSecurityPolicy];
        
        _shareClient.object_RequestAtMapTable = [[NSMapTable alloc] initWithKeyOptions:NSMapTableStrongMemory valueOptions:NSMapTableWeakMemory capacity:0];
    });
    return _shareClient;
}

/**
 配置自建证书的Https请求，只需要将CA证书文件放入根目录就行
 */
- (void)setupSecurityPolicy
{
    NSSet <NSData *> *cerSet = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
    if (cerSet.count == 0)  {  // 次
        /*!
         采用默认的defaultPolicy就可以了. AFN默认的securityPolicy就是它, 不必另写代码. AFSecurityPolicy类中会调用苹果security.framework的机制去自行验证本次请求服务端放回的证书是否是经过正规签名.
         */
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        _shareClient.securityPolicy = securityPolicy;
    }  else  {
        /*! 自定义的CA证书配置如下： */
        /*! 自定义security policy, 先前确保你的自定义CA证书已放入工程Bundle */
        /*!
         https://api.github.com网址的证书实际上是正规CADigiCert签发的, 这里把Charles的CA根证书导入系统并设为信任后, 把Charles设为该网址的SSL Proxy (相当于"中间人"), 这样通过代理访问服务器返回将是由Charles伪CA签发的证书.
         */
        // 使用证书验证模式
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:cerSet];
        // 如果需要验证自建证书(无效证书)，需要设置为YES
        securityPolicy.allowInvalidCertificates = YES;
        // 是否需要验证域名，默认为YES
        //    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
        
        _shareClient.securityPolicy = securityPolicy;
        /*! 如果服务端使用的是正规CA签发的证书, 那么以下几行就可去掉: */
        //            NSSet <NSData *> *cerSet = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
        //            AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:cerSet];
        //            policy.allowInvalidCertificates = YES;
        //            BANetManagerShare.sessionManager.securityPolicy = policy;
    }
}

-(void)requestWithRequest:(LQHttpRequest *)request
           forObjInstance:(id)bindObj
             successBlock:(HTTPSuccessBlock)compleBlock
               errorBlock:(HTTPErrorBlock)errorBlock
{
    if (request.limitType == kHTTPRequestLimitTypeAuthentication) { // 请求头拼上token
        [request.headerValues enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self.requestSerializer setValue:obj forHTTPHeaderField:key];
        }];
    }
    
    NSString *URLString  = request.urlString;
    if (0 == URLString.length) {
        return;
    }
    URLString = [NSURL URLWithString:URLString] ? request.urlString :lq_StrUTF8Encoding(URLString);
    
    if (request.isNeedCache) {
        id responseCacheData = [LQNetDataCache getDataWithKey:[URLString stringByAppendingString:request.parametersPairsValue?:@""]];
        if (compleBlock && responseCacheData) {
            LQHttpResponse *res = [request httpResponseParserData:(NSDictionary *)responseCacheData];
            compleBlock(res);
        }
    }
    
    __weak typeof(self)self_weak_ = self;
    void (^successHandler)(NSURLSessionDataTask * _Nonnull task,  id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LQHttpResponse *res = [request httpResponseParserData:(NSDictionary *)responseObject];
        
        [self_weak_.object_RequestAtMapTable removeObjectForKey:request];
        
        BOOL callbackData = YES;
        LQHttpError *handlerError = nil;
        if (self.ret) {
            handlerError = self.ret(res.ret, &callbackData);
        }
        
        if (!callbackData) {// 不回调数据了
            if (errorBlock && handlerError)  errorBlock(handlerError);return;
        }
        
        if (compleBlock) {
            compleBlock(res);
        }
        
        // 数据缓存
        if (res.ret == 0 && request.isNeedCache) {
            [LQNetDataCache setHttpData:responseObject cacheKey:[URLString stringByAppendingString:request.parametersPairsValue?:@""]];
        }
    };
    
//    void (^downloadProgress)(NSProgress * _Nonnull downloadProgress) = ^(NSProgress * _Nonnull downloadProgress) {};
    
    void (^errorHandler)(NSURLSessionDataTask * _Nonnull task,  NSError * _Nullable error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LQHttpError *aError = [[LQHttpError alloc] initWithType:(kHTTPErrorTypeServer)
                                                          code:((NSHTTPURLResponse *)task.response).statusCode
                                                       message:error.domain];
        if (errorBlock) {
            errorBlock(aError);
        }
        [self_weak_.object_RequestAtMapTable removeObjectForKey:request];
    };
    
    NSURLSessionDataTask *dataTask = nil;
    switch (request.method) {
        case kHTTPRequstMethodGet:{
            dataTask = [self GET:URLString parameters:request.parameters progress:nil success:successHandler failure:errorHandler];
            break;
        }
        case kHTTPRequstMethodPut:
        case kHTTPRequstMethodPost:{
            dataTask = [self POST:URLString parameters:request.parameters progress:nil success:successHandler failure:errorHandler];
            break;
        }
        case kHTTPRequstMethodDelete:{
            dataTask = [self DELETE:URLString parameters:request.parameters success:successHandler failure:errorHandler];
            break;
        }
        default:
            break;
    }

    [self.object_RequestAtMapTable setObject:dataTask forKey:request];
}

-(void)cancelWithRequest:(LQHttpRequest *)request
{
    NSURLSessionDataTask *dataTask = [self.object_RequestAtMapTable objectForKey:request];
    [dataTask cancel];
}

void lq_Request(id bindObj, LQHttpRequest *request, HTTPSuccessBlock compleBlock, HTTPErrorBlock errorBlock)
{
    [[LQHTTPClient shareClient] requestWithRequest:request forObjInstance:bindObj successBlock:compleBlock errorBlock:errorBlock];
}

void lq_CancelOpWithRequest(LQHttpRequest *request)
{
    [[LQHTTPClient shareClient] cancelWithRequest:request];
}


BOOL lq_NetReachable(void)
{
    return ([LQHTTPClient shareClient].reachabilityManager.networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable);
}


@end
