//
//  EMAnchorDtailInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDtailInfo.h"

@implementation EMAnchorDtailInfo

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {  return nil;  }
    self = [super init];
    if (!self) { return nil; }
    startParser(dic, self, EMAnchorDtailInfo)
    parserBaseAttr(favorites, integerValue)
    parserBaseAttr(albumRecommentIndentitier, integerValue)
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
    parserBaseAttr(newComments, integerValue)
    parserBaseAttr(waittingCount, integerValue)
    parserBaseAttr(newZoneCommentCount, integerValue)
    parserBaseAttr(noReadFollowers, integerValue)
    parserBaseAttr(answeredCount, integerValue)
    parserBaseAttr(incomeIdentifier, integerValue)
    parserBaseAttr(stateInfoIdentifier, integerValue)
    parserBaseAttr(totalSubcribed, integerValue)
    parserBaseAttr(listeneds, integerValue)
    parserBaseAttr(noReadAskAndAnswerMsgs, integerValue)
    parserBaseAttr(favoriteAlbums, integerValue)
    parserBaseAttr(newFeedCount, integerValue)
    parserBaseAttr(followers, integerValue)
    parserBaseAttr(followingTags, integerValue)
    parserBaseAttr(followings, integerValue)
    parserBaseAttr(albumNewCommentCount, integerValue)
    parserBaseAttr(newNotices, integerValue)
    parserBaseAttr(livingCount, integerValue)
    parserBaseAttr(leters, integerValue)
    parserBaseAttr(groupCount, integerValue)
    parserBaseAttr(totalPlayedNum, integerValue)
    parserBaseAttr(uid, integerValue)
    parserBaseAttr(newTingComments, integerValue)
    parserBaseAttr(messages, integerValue)
    parserBaseAttr(gender, integerValue)
    parserBaseAttr(newTingPraises, integerValue)
    parserBaseAttr(overCount, integerValue)
    parserBaseAttr(newThirdRegisters, integerValue)
    parserBaseAttr(verifyEntryType, integerValue)
    parserBaseAttr(totalSpace, integerValue)
    parserBaseAttr(vipExpireTime, longLongValue)
    parserBaseAttr(registerTime, longLongValue)

    parserBaseAttr(ifShowAskAndAnswerBubble, boolValue)
    parserBaseAttr(ifShowBubble, boolValue)
    parserBaseAttr(isOpenAskAndAnswer, boolValue)
    parserBaseAttr(isVip, boolValue)
    parserBaseAttr(isMutualFollowed, boolValue)
    parserBaseAttr(favoriteAlbumIsUpdate, boolValue)
    parserBaseAttr(isFollowed, boolValue)
    parserBaseAttr(hasLive, boolValue)
    parserBaseAttr(hasPwd, boolValue)
    parserBaseAttr(musician, boolValue)
    parserBaseAttr(isVerified, boolValue)

    parserObjAttr(backgroundLogo)
    parserObjAttr(personDescribe)
    parserObjAttr(mobileLargeLogo)
    parserObjAttr(location)
    parserObjAttr(personalSignature)
    parserObjAttr(vipUrl)
    parserObjAttr(mobileSmallLogo)
    parserObjAttr(nickname)
    parserObjAttr(mobileMiddleLogo)
    parserObjAttr(mobile)

    return self;
}

@end
