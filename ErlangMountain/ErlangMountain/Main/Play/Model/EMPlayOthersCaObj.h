//
//  EMPlayOthersCaObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 其他信息
 */
@interface EMPlayOthersCaObj : NSObject<LQDecode>
@property (nonatomic) NSInteger albumRecommentIndentitier;
@property (nonatomic) NSInteger favorites;
@property (nonatomic) NSInteger msg;
@property (nonatomic) NSInteger tingGroupCommentCount;
@property (nonatomic) NSInteger tingGroupPraiseCount;
@property (nonatomic) NSInteger contents;
@property (nonatomic) NSInteger tracks;
@property (nonatomic) NSInteger lastDayPlayedNum;
@property (nonatomic) NSInteger newEventCount;
@property (nonatomic) NSInteger albums;
@property (nonatomic) NSInteger events;
@property (nonatomic) NSInteger usedSpace;
@property (nonatomic) NSInteger newAts;
@property (nonatomic) NSInteger lastDaySubcribed;
@property (nonatomic) BOOL ifShowAskAndAnswerBubble;
@property (nonatomic) BOOL ifShowBubble;
@property (nonatomic) BOOL isVip;
@property (nonatomic) NSInteger newComments;
@property (nonatomic) NSInteger waittingCount;
@property (nonatomic) NSInteger newZoneCommentCount;
@property (nonatomic, copy) NSString * personDescribe;
@property (nonatomic) NSInteger noReadFollowers;
@property (nonatomic, copy) NSString * mobileLargeLogo;
@property (nonatomic) NSInteger answeredCount;
@property (nonatomic) BOOL isOpenAskAndAnswer;
@property (nonatomic) NSInteger incomeIdentifier;
@property (nonatomic, copy) NSString * location;
@property (nonatomic) NSInteger stateInfoIdentifier;
@property (nonatomic) NSInteger totalSubcribed;
@property (nonatomic) BOOL isMutualFollowed;
@property (nonatomic) NSInteger listeneds;
@property (nonatomic) BOOL favoriteAlbumIsUpdate;
@property (nonatomic) NSInteger noReadAskAndAnswerMsgs;
@property (nonatomic, copy) NSString * personalSignature;
@property (nonatomic) NSInteger favoriteAlbums;
@property (nonatomic) NSInteger newFeedCount;
@property (nonatomic) NSInteger followers;
@property (nonatomic) NSInteger followingTags;
@property (nonatomic) NSInteger followings;
@property (nonatomic) BOOL isFollowed;
@property (nonatomic) NSInteger albumNewCommentCount;
@property (nonatomic) NSInteger newNotices;
@property (nonatomic, copy) NSString * vipUrl;
@property (nonatomic) long long  registerTime;
@property (nonatomic, copy) NSString * backgroundLogo;
@property (nonatomic) BOOL hasLive;
@property (nonatomic) NSInteger livingCount;
@property (nonatomic) NSInteger leters;
@property (nonatomic) NSInteger groupCount;
@property (nonatomic) NSInteger totalPlayedNum;
@property (nonatomic) NSInteger uid;
@property (nonatomic) NSInteger newTingComments;
@property (nonatomic, copy) NSString * mobileSmallLogo;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic) BOOL hasPwd;
@property (nonatomic) NSInteger messages;
@property (nonatomic) NSInteger gender;
@property (nonatomic) NSInteger newTingPraises;
@property (nonatomic, copy) NSString * mobileMiddleLogo;
@property (nonatomic) BOOL musician;
@property (nonatomic) NSInteger overCount;
@property (nonatomic) BOOL isVerified;
@property (nonatomic) NSInteger newThirdRegisters;
@property (nonatomic) NSInteger verifyEntryType;
@property (nonatomic, copy) NSString * mobile;
@property (nonatomic) NSInteger vipExpireTime;
@property (nonatomic) NSInteger totalSpace;

@end

/*
 [0]    (null)    @"albumRecommentIndentitier" : (long)1
 [1]    (null)    @"favorites" : (long)0
 [2]    (null)    @"msg" : @"0"
 [3]    (null)    @"tingGroupCommentCount" : (long)0
 [4]    (null)    @"tingGroupPraiseCount" : (long)0
 [5]    (null)    @"contents" : (long)0
 [6]    (null)    @"tracks" : (long)132
 [7]    (null)    @"lastDayPlayedNum" : (long)0
 [8]    (null)    @"newEventCount" : (long)0
 [9]    (null)    @"albums" : (long)8
 [10]    (null)    @"events" : (long)0
 [11]    (null)    @"usedSpace" : (long)0
 [12]    (null)    @"newAts" : (long)0
 [13]    (null)    @"ret" : (long)0
 [14]    (null)    @"lastDaySubcribed" : (long)0
 [15]    (null)    @"ifShowAskAndAnswerBubble" : (no summary)
 [16]    (null)    @"ifShowBubble" : (no summary)
 [17]    (null)    @"newComments" : (long)0
 [18]    (null)    @"isVip" : (no summary)
 [19]    (null)    @"waittingCount" : (long)0
 [20]    (null)    @"newZoneCommentCount" : (long)0
 [21]    (null)    @"personDescribe" : @"共青团北京市委员会"
 [22]    (null)    @"noReadFollowers" : (long)0
 [23]    (null)    @"mobileLargeLogo" : @"http://fdfs.xmcdn.com/group36/M0B/38/E1/wKgJUlouE9qBIeTaAAIIP5FCWao909_mobile_x_large.jpg"
 [24]    (null)    @"answeredCount" : (long)0
 [25]    (null)    @"isOpenAskAndAnswer" : (no summary)
 [26]    (null)    @"incomeIdentifier" : (long)0
 [27]    (null)    @"location" : @"北京"
 [28]    (null)    @"stateInfoIdentifier" : (long)0
 [29]    (null)    @"totalSubcribed" : (long)0
 [30]    (null)    @"isMutualFollowed" : (no summary)
 [31]    (null)    @"listeneds" : (long)0
 [32]    (null)    @"favoriteAlbumIsUpdate" : (no summary)
 [33]    (null)    @"noReadAskAndAnswerMsgs" : (long)0
 [34]    (null)    @"personalSignature" : @"我是共青团北京市委员会，团团最喜欢跟年轻人一起玩啦～"
 [35]    (null)    @"favoriteAlbums" : (long)0
 [36]    (null)    @"newFeedCount" : (long)0
 [37]    (null)    @"followers" : (long)11428
 [38]    (null)    @"followingTags" : (long)0
 [39]    (null)    @"followings" : (long)2
 [40]    (null)    @"isFollowed" : (no summary)
 [41]    (null)    @"albumNewCommentCount" : (long)0
 [42]    (null)    @"newNotices" : (long)0
 [43]    (null)    @"vipUrl" : @"http://m.ximalaya.com/vip/myvip/ts-1525336673200"
 [44]    (null)    @"registerTime" : (long)1485444597000
 [45]    (null)    @"backgroundLogo" : @"http://s1.xmcdn.com/css/img/passport/app_home_bg/4.jpg"
 [46]    (null)    @"hasLive" : (no summary)
 [47]    (null)    @"livingCount" : (long)0
 [48]    (null)    @"leters" : (long)0
 [49]    (null)    @"groupCount" : (long)0
 [50]    (null)    @"totalPlayedNum" : (long)0
 [51]    (null)    @"uid" : (long)72169674
 [52]    (null)    @"newTingComments" : (long)0
 [53]    (null)    @"mobileSmallLogo" : @"http://fdfs.xmcdn.com/group36/M0B/38/E1/wKgJUlouE9qBIeTaAAIIP5FCWao909_mobile_small.jpg"
 [54]    (null)    @"nickname" : @"共青团北京市委员会"
 [55]    (null)    @"hasPwd" : (no summary)
 [56]    (null)    @"messages" : (long)0
 [57]    (null)    @"gender" : (long)0
 [58]    (null)    @"newTingPraises" : (long)0
 [59]    (null)    @"mobileMiddleLogo" : @"http://fdfs.xmcdn.com/group36/M0B/38/E1/wKgJUlouE9qBIeTaAAIIP5FCWao909_web_x_large.jpg"
 [60]    (null)    @"musician" : (no summary)
 [61]    (null)    @"overCount" : (long)0
 [62]    (null)    @"isVerified" : (no summary)
 [63]    (null)    @"newThirdRegisters" : (long)0
 [64]    (null)    @"verifyEntryType" : (long)3
 [65]    (null)    @"mobile" : @"18810407248"
 [66]    (null)    @"vipExpireTime" : (long)0
 [67]    (null)    @"totalSpace" : (long)0
 */
