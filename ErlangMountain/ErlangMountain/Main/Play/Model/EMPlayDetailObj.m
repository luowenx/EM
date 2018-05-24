//
//  EMPlayDetailObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayDetailObj.h"
#import "EMAnchorInfo.h"

@implementation EMPlayDetailObj

-(instancetype)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super initWith:dic];
    if (!self){ return  nil;}
    startParser(dic, self, EMPlayDetailObj)
    parserObjAttr(priceTypes)
    parserObjAttr(trackBlocks)
    if (lqpIsJsonElementValid(intdic, @"userInfo", NULL)) {
        inobj.userInfo = [[EMAnchorInfo alloc] initWith:intdic[@"userInfo"]];
    }
    
    parserObjAttr(albumTitle)
    parserObjAttr(intro)
    parserObjAttr(downloadAacUrl)
    parserObjAttr(albumImage)
    parserObjAttr(downloadUrl)
    
    parserBaseAttr(categoryId, integerValue)
    parserBaseAttr(priceTypeEnum, integerValue)
    parserBaseAttr(sampleDuration, integerValue)
    parserBaseAttr(downloadSize, integerValue)
    parserBaseAttr(downloadAacSize, integerValue)

    parserBaseAttr(isFree, boolValue)
    parserBaseAttr(priceTypeId, integerValue)
    parserBaseAttr(isVipFree, boolValue)
    parserBaseAttr(isAuthorized, boolValue)
    parserBaseAttr(isLike, boolValue)
    
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [super toJSON].mutableCopy;
    if (self.userInfo) {
        [aParameters setObject:self.toJSON forKey:@"userInfo"];
    }
    __setObjAttr(aParameters, albumTitle)
    __setObjAttr(aParameters, intro)
    __setObjAttr(aParameters, downloadAacUrl)
    __setObjAttr(aParameters, albumImage)
    __setObjAttr(aParameters, downloadUrl)
    
    __setBaseAttrInsist(aParameters, categoryId)
    __setBaseAttrInsist(aParameters, priceTypeEnum)
    __setBaseAttrInsist(aParameters, sampleDuration)
    __setBaseAttrInsist(aParameters, downloadSize)
    __setBaseAttrInsist(aParameters, downloadAacSize)
    
    __setBaseAttrInsist(aParameters, isFree)
    __setBaseAttrInsist(aParameters, priceTypeId)
    __setBaseAttrInsist(aParameters, isVipFree)
    __setBaseAttrInsist(aParameters, isAuthorized)
    __setBaseAttrInsist(aParameters, isLike)
    return aParameters.copy;
}

@end

