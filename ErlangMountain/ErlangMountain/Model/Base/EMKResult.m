//
//  EMKResult.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMKResult.h"

@implementation EMKResult

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMKResult)
    parserObjAttr(title)
    parserBaseAttr(id, integerValue)
    parserObjAttr(contentType)
    
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    __setObjAttr(dic, title)
    __setObjAttr(dic, contentType)
    __setBaseAttr(dic, id)
    return dic.copy;
}

@end
