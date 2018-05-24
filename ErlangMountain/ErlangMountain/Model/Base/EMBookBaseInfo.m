//
//  EMBookBaseInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMBookBaseInfo.h"

@implementation EMBookBaseInfo

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMBookBaseInfo)
    parserObjAttr(tname)
    parserBaseAttr(category_id, integerValue)
    
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    __setBaseAttrInsist(dic, category_id)
    __setObjAttr(dic, tname)
    
    return dic.copy;
}


@end
