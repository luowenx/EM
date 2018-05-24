//
//  EMAlbumObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumObj.h"

@implementation EMAlbumObj

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super initWith:dic];
    if (!self){ return  nil;}
    startParser(dic, self, EMAlbumObj)
    parserBaseAttr(playTimes, integerValue)
    parserBaseAttr(updatedAt, longLongValue)
    parserBaseAttr(createdAt, longLongValue)
    parserBaseAttr(categoryId, integerValue)
    parserBaseAttr(hasNew, boolValue)
    parserBaseAttr(lastUptrackId, integerValue)
    parserBaseAttr(serializeStatus, integerValue)
    parserBaseAttr(isFavorite, boolValue)
    parserBaseAttr(is_default, boolValue)
    parserBaseAttr(isVerified, boolValue)
    parserBaseAttr(playTrackId, integerValue)
    parserBaseAttr(shares, integerValue)
    parserBaseAttr(unReadAlbumCommentCount, integerValue)
    parserBaseAttr(canShareAndStealListen, boolValue)
    parserBaseAttr(isRecordDesc, boolValue)
    parserBaseAttr(offlineReason, integerValue)
    parserBaseAttr(status, integerValue)
    parserBaseAttr(followers, integerValue)
    parserBaseAttr(isDefault, boolValue)
    parserBaseAttr(canInviteListen, boolValue)
    parserBaseAttr(offlineType, integerValue)
    parserBaseAttr(isFollowed, boolValue)
    parserBaseAttr(shareSupportType, integerValue)
    parserBaseAttr(saleScope, integerValue)
    parserBaseAttr(vipFreeType, integerValue)

    parserObjAttr(shortIntro)
    parserObjAttr(introRich)
    parserObjAttr(coverLargePop)
    parserObjAttr(categoryName)
    parserObjAttr(lastUptrackTitle)
    parserObjAttr(coverOrigin)
    parserObjAttr(coverWebLarge)
    parserObjAttr(shortIntroRich)
    parserObjAttr(lastUptrackCoverPath)
    parserObjAttr(avatarPath)
    parserObjAttr(customSubTitle)
    
    return self;
}

LQDataTransformationImplementation

@end
