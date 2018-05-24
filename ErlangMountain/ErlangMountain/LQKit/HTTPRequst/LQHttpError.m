//
//  LQHttpError.m
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQHttpError.h"

@implementation LQHttpError

-(instancetype)initWithType:(HTTPErrorType)type code:(NSInteger)code message:(NSString *)message
{
    if (self  = [super init]) {
        _type = type;
        _statusCode = code;
        _message = message;
    }
    return self;
}

@end
