//
//  EMAnchor.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchor.h"
#import "EMFollowsManager.h"

@implementation EMAnchor

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMAnchor)
    parserBaseAttr(uid, integerValue)
    parserBaseAttr(isVerified, boolValue)
    parserBaseAttr(isFollowed, boolValue)
    
    parserObjAttr(smallLogo)
    parserObjAttr(nickname)
    
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [NSMutableDictionary dictionary];
    __setObjAttr(aParameters, smallLogo)
    __setObjAttr(aParameters, nickname)
    __setBaseAttr(aParameters, uid)
    __setBaseAttrInsist(aParameters, isVerified)
    __setBaseAttrInsist(aParameters, isFollowed)
    
    return aParameters.copy;
}

@end
