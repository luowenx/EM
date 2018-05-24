//
//  EMAnchorDtailInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主播详细信息
 */
@interface EMAnchorDtailInfo : NSObject<LQDecode>
@property (nonatomic) NSInteger albumRecommentIndentitier;
@property (nonatomic) NSInteger favorites;
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
@property (nonatomic) NSInteger newComments;
@property (nonatomic) NSInteger waittingCount;
@property (nonatomic) NSInteger newZoneCommentCount;
@property (nonatomic) NSInteger noReadFollowers;
@property (nonatomic) NSInteger answeredCount;
@property (nonatomic) NSInteger incomeIdentifier;
@property (nonatomic) NSInteger stateInfoIdentifier;
@property (nonatomic) NSInteger totalSubcribed;
@property (nonatomic) NSInteger listeneds;
@property (nonatomic) NSInteger noReadAskAndAnswerMsgs;
@property (nonatomic) NSInteger favoriteAlbums;
@property (nonatomic) NSInteger newFeedCount;
@property (nonatomic) NSInteger followers;
@property (nonatomic) NSInteger followingTags;
@property (nonatomic) NSInteger followings;
@property (nonatomic) NSInteger albumNewCommentCount;
@property (nonatomic) NSInteger newNotices;
@property (nonatomic) NSInteger livingCount;
@property (nonatomic) NSInteger leters;
@property (nonatomic) NSInteger groupCount;
@property (nonatomic) NSInteger totalPlayedNum;
@property (nonatomic) NSInteger uid;
@property (nonatomic) NSInteger newTingComments;
@property (nonatomic) NSInteger messages;
@property (nonatomic) NSInteger gender;
@property (nonatomic) NSInteger newTingPraises;
@property (nonatomic) NSInteger overCount;
@property (nonatomic) NSInteger newThirdRegisters;
@property (nonatomic) NSInteger verifyEntryType;
@property (nonatomic) NSInteger totalSpace;

@property (nonatomic) long long vipExpireTime;
@property (nonatomic) long long  registerTime;
@property (nonatomic) BOOL ifShowAskAndAnswerBubble;
@property (nonatomic) BOOL ifShowBubble;
@property (nonatomic) BOOL isOpenAskAndAnswer;
@property (nonatomic) BOOL isVip;
@property (nonatomic) BOOL isMutualFollowed;
@property (nonatomic) BOOL favoriteAlbumIsUpdate;
@property (nonatomic) BOOL isFollowed;
@property (nonatomic) BOOL hasLive;
@property (nonatomic) BOOL hasPwd;
@property (nonatomic) BOOL musician;
@property (nonatomic) BOOL isVerified;

@property (nonatomic, copy) NSString * backgroundLogo;
@property (nonatomic, copy) NSString * personDescribe;
@property (nonatomic, copy) NSString * mobileLargeLogo;
@property (nonatomic, copy) NSString * location;
@property (nonatomic, copy) NSString * personalSignature;
@property (nonatomic, copy) NSString * vipUrl;
@property (nonatomic, copy) NSString * mobileSmallLogo;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic, copy) NSString * mobileMiddleLogo;
@property (nonatomic, copy) NSString * mobile;

@end

/**
 [0]    (null)    @"albumRecommentIndentitier" : (long)1
 [1]    (null)    @"favorites" : (long)0
 [2]    (null)    @"msg" : @"0"
 [3]    (null)    @"tingGroupCommentCount" : (long)0
 [4]    (null)    @"tingGroupPraiseCount" : (long)0
 [5]    (null)    @"contents" : (long)0
 [6]    (null)    @"tracks" : (long)7
 [7]    (null)    @"lastDayPlayedNum" : (long)0
 [8]    (null)    @"newEventCount" : (long)0
 [9]    (null)    @"albums" : (long)1
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
 [21]    (null)    @"personDescribe" : @"商业财经"
 [22]    (null)    @"noReadFollowers" : (long)0
 [23]    (null)    @"mobileLargeLogo" : @"http://fdfs.xmcdn.com/group41/M01/78/54/wKgJ8lqyHbzzwCuOAAGPiMeiuFQ903_mobile_x_large.png"
 [24]    (null)    @"answeredCount" : (long)0
 [25]    (null)    @"isOpenAskAndAnswer" : (no summary)
 [26]    (null)    @"incomeIdentifier" : (long)0
 [27]    (null)    @"location" : @""
 [28]    (null)    @"stateInfoIdentifier" : (long)0
 [29]    (null)    @"totalSubcribed" : (long)0
 [30]    (null)    @"isMutualFollowed" : (no summary)
 [31]    (null)    @"listeneds" : (long)0
 [32]    (null)    @"favoriteAlbumIsUpdate" : (no summary)
 [33]    (null)    @"noReadAskAndAnswerMsgs" : (long)0
 [34]    (null)    @"personalSignature" : @"中国纪录片领先品牌"
 [35]    (null)    @"favoriteAlbums" : (long)0
 [36]    (null)    @"newFeedCount" : (long)0
 [37]    (null)    @"followers" : (long)7561
 [38]    (null)    @"followingTags" : (long)0
 [39]    (null)    @"followings" : (long)1
 [40]    (null)    @"isFollowed" : (no summary)
 [41]    (null)    @"albumNewCommentCount" : (long)0
 [42]    (null)    @"newNotices" : (long)0
 [43]    (null)    @"vipUrl" : @"http://m.ximalaya.com/vip/myvip/ts-1525858743677"
 [44]    (null)    @"registerTime" : (long)1521607203000
 [45]    (null)    @"backgroundLogo" : @"http://s1.xmcdn.com/css/img/passport/app_home_bg/4.jpg"
 [46]    (null)    @"hasLive" : (no summary)
 [47]    (null)    @"livingCount" : (long)0
 [48]    (null)    @"leters" : (long)0
 [49]    (null)    @"groupCount" : (long)0
 [50]    (null)    @"totalPlayedNum" : (long)0
 [51]    (null)    @"uid" : (long)108497046
 [52]    (null)    @"newTingComments" : (long)0
 [53]    (null)    @"mobileSmallLogo" : @"http://fdfs.xmcdn.com/group41/M01/78/54/wKgJ8lqyHbzzwCuOAAGPiMeiuFQ903_mobile_small.png"
 [54]    (null)    @"nickname" : @"云集将来"
 [55]    (null)    @"hasPwd" : (no summary)
 [56]    (null)    @"messages" : (long)0
 [57]    (null)    @"gender" : (long)0
 [58]    (null)    @"newTingPraises" : (long)0
 [59]    (null)    @"mobileMiddleLogo" : @"http://fdfs.xmcdn.com/group41/M01/78/54/wKgJ8lqyHbzzwCuOAAGPiMeiuFQ903_web_x_large.png"
 [60]    (null)    @"musician" : (no summary)
 [61]    (null)    @"overCount" : (long)0
 [62]    (null)    @"isVerified" : (no summary)
 [63]    (null)    @"newThirdRegisters" : (long)0
 [64]    (null)    @"verifyEntryType" : (long)3
 [65]    (null)    @"mobile" : @"15901710389"
 [66]    (null)    @"vipExpireTime" : (long)0
 [67]    (null)    @"totalSpace" : (long)0
 */
