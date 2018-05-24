//
//  EMPlayItemInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayItemInfo.h"

@implementation EMPlayItemInfo

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMPlayItemInfo)
    parserBaseAttr(status, integerValue)
    parserBaseAttr(isVideo, boolValue)
    parserBaseAttr(isRichAudio, boolValue)
    parserBaseAttr(duration, integerValue)
    parserBaseAttr(processState, integerValue)
    parserBaseAttr(isPaid, integerValue)
    parserBaseAttr(userSource, integerValue)
    parserBaseAttr(likes, integerValue)
    parserBaseAttr(createdAt, longLongValue)
    parserBaseAttr(shares, integerValue)
    parserBaseAttr(albumId, integerValue)
    parserBaseAttr(playtimes, integerValue)
    parserBaseAttr(uid, integerValue)
    parserBaseAttr(comments, integerValue)
    parserBaseAttr(trackId, integerValue)
    parserBaseAttr(isDraft, boolValue)
    parserBaseAttr(isPublic, integerValue)
    parserBaseAttr(opType, integerValue)
    
    parserObjAttr(title)
    parserObjAttr(nickname)
    parserObjAttr(playPathHq)
    parserObjAttr(coverMiddle)
    parserObjAttr(playPathAacv224)
    parserObjAttr(smallLogo)
    parserObjAttr(playUrl64)
    parserObjAttr(playPathAacv164)
    parserObjAttr(playUrl32)
    parserObjAttr(coverLarge)
    parserObjAttr(coverSmall)
    
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [NSMutableDictionary dictionary];
    __setBaseAttrInsist(aParameters, opType)
    __setBaseAttrInsist(aParameters, isPublic)
    __setBaseAttrInsist(aParameters, isDraft)
    __setBaseAttrInsist(aParameters, trackId)
    __setBaseAttrInsist(aParameters, comments)
    __setBaseAttrInsist(aParameters, uid)
    __setBaseAttrInsist(aParameters, playtimes)
    __setBaseAttrInsist(aParameters, albumId)
    __setBaseAttrInsist(aParameters, shares)
    __setBaseAttrInsist(aParameters, createdAt)
    __setBaseAttrInsist(aParameters, likes)
    __setBaseAttrInsist(aParameters, userSource)
    __setBaseAttrInsist(aParameters, isPaid)
    __setBaseAttrInsist(aParameters, processState)
    __setBaseAttrInsist(aParameters, duration)
    __setBaseAttrInsist(aParameters, isRichAudio)
    __setBaseAttrInsist(aParameters, isVideo)
    __setBaseAttrInsist(aParameters, status)
    
    __setObjAttr(aParameters, title)
    __setObjAttr(aParameters, nickname)
    __setObjAttr(aParameters, playPathHq)
    __setObjAttr(aParameters, coverMiddle)
    __setObjAttr(aParameters, coverLarge)
    __setObjAttr(aParameters, coverSmall)
    __setObjAttr(aParameters, playPathAacv224)
    __setObjAttr(aParameters, smallLogo)
    __setObjAttr(aParameters, playUrl64)
    __setObjAttr(aParameters, playPathAacv164)
    __setObjAttr(aParameters, playUrl32)
    return aParameters.copy;
}

@end
