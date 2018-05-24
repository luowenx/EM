//
//  EMAnchorAlbumObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumBaseInfo.h"

/**
 主播专辑
 */
@interface EMAnchorAlbumObj : EMAlbumBaseInfo
@property (nonatomic) BOOL is_default;
@property (nonatomic) BOOL isDefault;
@property (nonatomic) BOOL isOpenGiftSwitch;
@property (nonatomic) BOOL isFromAudioPlus;
@property (nonatomic) BOOL isPublic;
@property (nonatomic) BOOL isLastUpdated;
@property (nonatomic) NSInteger status;
@property (nonatomic) NSInteger qualityScoreUpdatedAt;
@property (nonatomic) NSInteger shares;
@property (nonatomic) NSInteger qualityScore;
@property (nonatomic) NSInteger unReadAlbumCommentCount;
@property (nonatomic) NSInteger serializeStatus;
@property (nonatomic) NSInteger playTimes;
@property (nonatomic) long long  updatedAt;
@end

/*
 [0]    (null)    @"is_default" : (no summary)
 [1]    (null)    @"status" : (long)1
 [2]    (null)    @"title" : @"竞彩电台每日直播精华"
 [3]    (null)    @"serialState" : (long)1
 [4]    (null)    @"coverMiddle" : @"http://fdfs.xmcdn.com/group41/M02/F7/4A/wKgJ8lrIJaaCFCsuAACy49RgDv8964_mobile_meduim.jpg"
 [5]    (null)    @"qualityScoreUpdatedAt" : (long)0
 [6]    (null)    @"shares" : (long)90
 [7]    (null)    @"intro" : @"【直播回听】周三竞彩电台：西甲欧战冲击"
 [8]    (null)    @"isPaid" : (no summary)
 [9]    (null)    @"qualityScore" : (no summary)
 [10]    (null)    @"isDefault" : (no summary)
 [11]    (null)    @"albumId" : (long)14749638
 [12]    (null)    @"updatedAt" : (long)1525880504000
 [13]    (null)    @"lastUptrackAt" : (long)1525880504000
 [14]    (null)    @"coverSmall" : @"http://fdfs.xmcdn.com/group41/M02/F7/4A/wKgJ8lrIJaaCFCsuAACy49RgDv8964_mobile_small.jpg"
 [15]    (null)    @"coverLarge" : @"http://fdfs.xmcdn.com/group41/M02/F7/4A/wKgJ8lrIJaaCFCsuAACy49RgDv8964_mobile_large.jpg"
 [16]    (null)    @"uid" : (long)108687108
 [17]    (null)    @"isOpenGiftSwitch" : (no summary)
 [18]    (null)    @"tracks" : (long)30
 [19]    (null)    @"unReadAlbumCommentCount" : (long)0
 [20]    (null)    @"isFromAudioPlus" : (no summary)
 [21]    (null)    @"serializeStatus" : (long)1
 [22]    (null)    @"isPublic" : (no summary)
 [23]    (null)    @"isDraft" : (no summary)
 [24]    (null)    @"isLastUpdated" : (no summary)
 [25]    (null)    @"playTimes" : (long)15195
 */
