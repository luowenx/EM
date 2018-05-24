//
//  LQHttpRequest.m
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQHttpRequest.h"
#import "LQHTTPClient.h"

@implementation LQHttpRequest {
    NSMutableDictionary *internalParameter_;
    
    NSString *internalParametersPairsValue_;
}


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.isNeedCache = NO;
        self.method = kHTTPRequstMethodGet;
        self.limitType = kHTTPRequestLimitTypeAuthentication;
    }
    return self;
}

- (NSDictionary *)parameters
{
    if (!internalParameter_) {
        internalParameter_ = [[NSMutableDictionary alloc] initWithCapacity:0];
        [self buildRequestParameterWithDictionary:internalParameter_];
        [self parametersPairsValue];
    }
    
    return internalParameter_;
}

- (NSString *)parametersPairsValue
{
    if (!self.parameters || self.parameters.count == 0) {
        return nil;
    }
    if ([internalParametersPairsValue_ length] == 0) {
        NSArray *sortedArray = [[self.parameters allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];
        
        NSMutableArray *mutablePairs = [[NSMutableArray alloc] init];
        for (NSString *key in sortedArray) {
            [mutablePairs addObject:[NSString stringWithFormat:@"%@=%@",key, self.parameters[key]]];
        }
        internalParametersPairsValue_ = [mutablePairs componentsJoinedByString:@"&"];
    }
    return internalParametersPairsValue_;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    
}

- (void)apendRelativeUrlWith:(NSString *)apendStr
{
    self.relativeUrl = [self.relativeUrl stringByAppendingString:apendStr];
}

- (LQHttpResponse *)httpResponseParserData:(id)aData
{
    return [[LQHttpResponse alloc] initWith:aData];
}

-(NSString *)urlString
{
    return [NSString stringWithFormat:@"%@%@", self.hostUrl.length>0?self.hostUrl:@"http://mobile.ximalaya.com"/* 服务器域名 */, self.relativeUrl];
}

- (void)requestWithCompletion:(HTTPSuccessBlock)completionBlock error:(HTTPErrorBlock)errorBlock
{
    lq_Request(nil, self, completionBlock, errorBlock);
}

- (void)requestWithTarget:(id)target completion:(HTTPSuccessBlock)completionBlock error:(HTTPErrorBlock)errorBlock
{
    lq_Request(target, self, completionBlock, errorBlock);
}

- (void)cancel
{
    lq_CancelOpWithRequest(self);
}

@end
