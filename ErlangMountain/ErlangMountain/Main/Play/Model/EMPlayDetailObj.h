//
//  EMPlayDetailObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayItemInfo.h"

/**
 播放具体信息
 */
@class EMAnchorInfo;
@interface EMPlayDetailObj : EMPlayItemInfo
@property (nonatomic, strong) NSArray *priceTypes;
@property (nonatomic, strong) NSArray * trackBlocks;
@property (nonatomic, strong) EMAnchorInfo * userInfo;

@property (nonatomic) NSInteger categoryId;
@property (nonatomic) NSInteger priceTypeEnum;
@property (nonatomic) NSInteger sampleDuration;
@property (nonatomic) NSInteger  downloadSize;
@property (nonatomic) NSInteger downloadAacSize;
@property (nonatomic) NSInteger priceTypeId;

@property (nonatomic, copy) NSString * albumTitle;
@property (nonatomic, copy) NSString * intro;
@property (nonatomic, copy) NSString * downloadAacUrl;
@property (nonatomic, copy) NSString * albumImage;
@property (nonatomic, copy) NSString * downloadUrl;

@property (nonatomic) BOOL isFree;
@property (nonatomic) BOOL isVipFree;
@property (nonatomic) BOOL isAuthorized;
@property (nonatomic) BOOL isLike;

@end
/*
 [0]    (null)    @"coverSmall" : @"http://fdfs.xmcdn.com/group14/M04/63/AD/wKgDZFXbBzjjMfFjAAaML56W3Wg621_web_meduim.jpg"
 [1]    (null)    @"uid" : (long)14528933
 [2]    (null)    @"priceTypes" : @"0 elements"
 [3]    (null)    @"categoryId" : (long)3
 [4]    (null)    @"processState" : (long)2
 [5]    (null)    @"priceTypeEnum" : (long)0
 [6]    (null)    @"coverMiddle" : @"http://fdfs.xmcdn.com/group14/M04/63/AD/wKgDZFXbBzjjMfFjAAaML56W3Wg621_web_large.jpg"
 [7]    (null)    @"sampleDuration" : (long)0
 [8]    (null)    @"isPublic" : (no summary)
 [9]    (null)    @"isVideo" : (no summary)
 [10]    (null)    @"comments" : (long)178
 [11]    (null)    @"playUrl32" : @"http://fdfs.xmcdn.com/group14/M04/64/4D/wKgDZFXcUXfyuV9VAHKkaEUcnto829.mp3"
 [12]    (null)    @"nickname" : @"全勇"
 [13]    (null)    @"userSource" : (long)1
 [14]    (null)    @"duration" : (long)1878
 [15]    (null)    @"playtimes" : (long)376134
 [16]    (null)    @"playPathAacv164" : @"http://audio.xmcdn.com/group14/M04/64/75/wKgDY1XcUb3yxVl9AOfHfblvbQ4073.m4a"
 [17]    (null)    @"albumTitle" : @"《江湖三十年》(上)"
 [18]    (null)    @"playPathAacv224" : @"http://audio.xmcdn.com/group14/M04/64/4D/wKgDZFXcUW3Bmb9zAFh4SbKl_T8809.m4a"
 [19]    (null)    @"type" : (long)0
 [20]    (null)    @"smallLogo" : @"http://fdfs.xmcdn.com/group12/M05/74/56/wKgDW1dBXomxkXZNAAFCqXAuocw507_mobile_small.jpg"
 [21]    (null)    @"shares" : (long)8
 [22]    (null)    @"playUrl64" : @"http://fdfs.xmcdn.com/group10/M01/63/EB/wKgDaVXcUbmyjLXgAOVIkZJTrJk164.mp3"
 [23]    (null)    @"downloadSize" : (long)7796163
 [24]    (null)    @"coverLarge" : @"http://fdfs.xmcdn.com/group14/M04/63/AD/wKgDZFXbBzjjMfFjAAaML56W3Wg621_mobile_large.jpg"
 [25]    (null)    @"intro" : @"2015最“江湖”的小说 天涯头条畅销书， 全面揭露 自古以来各种骗局骗术，给世人敲响警钟的！一部中国民间的百科全书，也是一部行走社会的防骗秘笈。 讲述江湖八大门派的秘术暗语黑话和帮派规则，数百个动人心魄的故事，悬念迭出、精彩绝伦，让人欲罢不能。"
 [26]    (null)    @"trackId" : (long)8449277
 [27]    (null)    @"likes" : (long)901
 [28]    (null)    @"ret" : (long)0
 [29]    (null)    @"createdAt" : (long)1440504000000
 [30]    (null)    @"isRichAudio" : (no summary)
 [31]    (null)    @"downloadAacUrl" : @"http://download.xmcdn.com/group14/M04/64/4D/wKgDZFXcUW3Bmb9zAFh4SbKl_T8809.m4a"
 [32]    (null)    @"isFree" : (no summary)
 [33]    (null)    @"status" : (long)1
 [34]    (null)    @"isPaid" : (no summary)
 [35]    (null)    @"priceTypeId" : (long)0
 [36]    (null)    @"isVipFree" : (no summary)
 [37]    (null)    @"trackBlocks" : @"0 elements"
 [38]    (null)    @"albumId" : (long)2897273
 [39]    (null)    @"isDraft" : (no summary)
 [40]    (null)    @"isAuthorized" : (no summary)
 [41]    (null)    @"isLike" : (no summary)
 [42]    (null)    @"albumImage" : @"http://fdfs.xmcdn.com/group8/M05/64/25/wKgDYVXa-zqwxnwhAAaML56W3Wg161_mobile_meduim.jpg"
 [43]    (null)    @"userInfo" : 15 key/value pairs
 [44]    (null)    @"msg" : @"0"
 [45]    (null)    @"playPathHq" : @""
 [46]    (null)    @"title" : @"江湖三十年1天机不可泄露 003 马戏团的秘密【欢迎打赏】"
 [47]    (null)    @"downloadAacSize" : (long)5797961
 [48]    (null)    @"downloadUrl" : @"http://download.xmcdn.com/group14/M04/64/74/wKgDY1XcUamik_1_AHb1w1Krpb0544.aac"
 */
