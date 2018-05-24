//
//  LQHttpResponse.m
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQHttpResponse.h"

@implementation LQHttpResponse

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) return nil;
    self = [super init];
    if (!self) return nil;
    
    startParser(dic, self, LQHttpResponse)
    parserBaseAttr(ret, integerValue)
    parserObjAttr(msg)
    parserObjAttr(data)
    
    return self;
}

@end
