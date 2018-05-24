//
//  EMAlbumBaseInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumBaseInfo.h"

@implementation EMAlbumBaseInfo

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) { return nil; }
    self = [super init];
    if (!self) { return nil;}
    startParser(dic, self, EMAlbumBaseInfo)
    parserObjAttr(title)
    parserObjAttr(tags)
    parserObjAttr(nickname)
    parserObjAttr(coverLarge)
    parserObjAttr(coverMiddle)
    parserObjAttr(coverSmall)
    parserObjAttr(albumCoverUrl290)
    parserObjAttr(intro)
    parserObjAttr(trackTitle)
    parserObjAttr(provider)
    
    parserBaseAttr(serialState, integerValue)
    parserBaseAttr(playsCounts, longLongValue)
    parserBaseAttr(isPaid, boolValue)
    parserBaseAttr(commentsCount, integerValue)
    parserBaseAttr(albumId, integerValue)
    parserBaseAttr(id, integerValue)
    parserBaseAttr(uid, integerValue)
    parserBaseAttr(tracks, integerValue)
    parserBaseAttr(refundSupportType, integerValue)
    parserBaseAttr(priceTypeId, integerValue)
    parserDiffBaseAttr(isFinished_, @"isFinished", integerValue)
    parserBaseAttr(trackId, integerValue)
    parserBaseAttr(isVipFree, boolValue)
    parserBaseAttr(isDraft, boolValue)
    parserBaseAttr(isCollectioned, boolValue)
    parserBaseAttr(lastUptrackAt, longLongValue)

    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [NSMutableDictionary dictionary];
    __setObjAttr(aParameters, title)
    __setObjAttr(aParameters, tags)
    __setObjAttr(aParameters, nickname)
    __setObjAttr(aParameters, coverLarge)
    __setObjAttr(aParameters, coverMiddle)
    __setObjAttr(aParameters, coverSmall)
    __setObjAttr(aParameters, albumCoverUrl290)
    __setObjAttr(aParameters, intro)
    __setObjAttr(aParameters, trackTitle)
    __setObjAttr(aParameters, provider)
    
    __setBaseAttrInsist(aParameters, serialState)
    __setBaseAttrInsist(aParameters, playsCounts)
    __setBaseAttrInsist(aParameters, isPaid)
    __setBaseAttrInsist(aParameters, commentsCount)
    __setBaseAttrInsist(aParameters, albumId)
    __setBaseAttrInsist(aParameters, id)
    __setBaseAttrInsist(aParameters, uid)
    __setBaseAttrInsist(aParameters, tracks)
    __setBaseAttrInsist(aParameters, refundSupportType)
    __setBaseAttrInsist(aParameters, priceTypeId)
    __setBaseAttrInsist(aParameters, trackId)
    __setBaseAttrInsist(aParameters, isVipFree)
    __setBaseAttrInsist(aParameters, isDraft)
    
    __setBaseAttrInsist(aParameters, lastUptrackAt)
    __setBaseAttrInsist(aParameters, isCollectioned)

    [aParameters setObject:@(self.isFinished_) forKey:@"isFinished"];

    return aParameters.copy;
}


LQDataTransformationImplementation

@end
