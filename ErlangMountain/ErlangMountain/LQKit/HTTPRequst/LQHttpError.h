//
//  LQHttpError.h
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPErrorType) {
    kHTTPErrorTypeNotReachable,//网络未接连
    kHTTPErrorTypeLocal,//本地错误
   kHTTPErrorTypeServer,//服务器错误
};

/**
 错误类
 */
@interface LQHttpError : NSObject

@property (nonatomic) NSInteger statusCode;

@property (nonatomic, copy) NSString * message;

@property (nonatomic, assign) HTTPErrorType type;

- (instancetype)initWithType:(HTTPErrorType)type code:(NSInteger)code message:(NSString*)message;

@end
