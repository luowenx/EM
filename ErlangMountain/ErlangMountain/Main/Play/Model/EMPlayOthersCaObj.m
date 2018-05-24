//
//  EMPlayOthersCaObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayOthersCaObj.h"

@implementation EMPlayOthersCaObj

-(instancetype)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMPlayOthersCaObj)
    
    parserBaseAttr(albumRecommentIndentitier, integerValue)
    parserBaseAttr(favorites, integerValue)
    parserBaseAttr(msg, integerValue)
    parserBaseAttr(tingGroupCommentCount, integerValue)
    parserBaseAttr(tingGroupPraiseCount, integerValue)
    parserBaseAttr(contents, integerValue)
    parserBaseAttr(tracks, integerValue)
    parserBaseAttr(lastDayPlayedNum, integerValue)
    parserBaseAttr(newEventCount, integerValue)
    parserBaseAttr(albums, integerValue)
    parserBaseAttr(events, integerValue)
    parserBaseAttr(usedSpace, integerValue)
    parserBaseAttr(newAts, integerValue)
    parserBaseAttr(lastDaySubcribed, integerValue)
    parserBaseAttr(ifShowAskAndAnswerBubble, boolValue)
    parserBaseAttr(ifShowBubble, boolValue)
    parserBaseAttr(isVip, boolValue)
    parserBaseAttr(newComments, integerValue)
    parserBaseAttr(waittingCount, integerValue)
    parserBaseAttr(newZoneCommentCount, integerValue)
    parserBaseAttr(noReadFollowers, integerValue)
    parserBaseAttr(answeredCount, integerValue)
    parserBaseAttr(isOpenAskAndAnswer, boolValue)
    parserBaseAttr(incomeIdentifier, integerValue)
    parserBaseAttr(stateInfoIdentifier, integerValue)
    parserBaseAttr(totalSubcribed, integerValue)
    parserBaseAttr(isMutualFollowed, boolValue)
    parserBaseAttr(listeneds, integerValue)
    parserBaseAttr(favoriteAlbumIsUpdate, boolValue)
    parserBaseAttr(favoriteAlbums, integerValue)
    parserBaseAttr(newFeedCount, integerValue)
    parserBaseAttr(followers, integerValue)
    parserBaseAttr(followingTags, integerValue)
    parserBaseAttr(followings, integerValue)
    parserBaseAttr(albumNewCommentCount, integerValue)
    parserBaseAttr(isFollowed, boolValue)
    parserBaseAttr(newNotices, integerValue)
    parserBaseAttr(registerTime, longLongValue)
    parserBaseAttr(hasLive, boolValue)
    parserBaseAttr(livingCount, integerValue)
    parserBaseAttr(leters, integerValue)
    parserBaseAttr(groupCount, integerValue)
    parserBaseAttr(totalPlayedNum, integerValue)
    parserBaseAttr(uid, integerValue)
    parserBaseAttr(newTingComments, integerValue)
    parserBaseAttr(hasPwd, boolValue)
    parserBaseAttr(messages, integerValue)
    parserBaseAttr(gender, integerValue)
    parserBaseAttr(newTingPraises, integerValue)
    parserBaseAttr(musician, boolValue)
    parserBaseAttr(overCount, integerValue)
    parserBaseAttr(isVerified, boolValue)
    parserBaseAttr(newThirdRegisters, integerValue)
    parserBaseAttr(verifyEntryType, integerValue)
    parserBaseAttr(vipExpireTime, integerValue)
    parserBaseAttr(totalSpace, integerValue)
    
    parserObjAttr(personDescribe)
    parserObjAttr(mobileLargeLogo)
    parserObjAttr(location)
    parserObjAttr(personalSignature)
    parserObjAttr(vipUrl)
    parserObjAttr(backgroundLogo)
    parserObjAttr(mobileSmallLogo)
    parserObjAttr(nickname)
    parserObjAttr(mobileMiddleLogo)
    parserObjAttr(mobile)
    
    return self;
}

@end
