//
//  EMPlayItemInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 作品对象
 */
@interface EMPlayItemInfo : NSObject<LQDecode, LQDataTransformation, LQEncode>
@property (nonatomic) NSInteger status;
@property (nonatomic) NSInteger duration;
@property (nonatomic) NSInteger processState;
@property (nonatomic) NSInteger userSource;
@property (nonatomic) NSInteger likes;
@property (nonatomic) long long createdAt;
@property (nonatomic) NSInteger shares;
@property (nonatomic) NSInteger albumId;
@property (nonatomic) NSInteger playtimes;
@property (nonatomic) NSInteger uid;
@property (nonatomic) NSInteger comments;
@property (nonatomic) NSInteger trackId;
@property (nonatomic) NSInteger opType;
@property (nonatomic) BOOL isVideo;
@property (nonatomic) BOOL isRichAudio;
@property (nonatomic) BOOL isPaid;
@property (nonatomic) BOOL isDraft;
@property (nonatomic) BOOL isPublic;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *playPathHq;
@property (nonatomic, copy) NSString * coverMiddle;
@property (nonatomic, copy) NSString * coverSmall;
@property (nonatomic, copy) NSString * coverLarge;
@property (nonatomic, copy) NSString * playPathAacv224;
@property (nonatomic, copy) NSString * smallLogo;
@property (nonatomic, copy) NSString * playUrl64;
@property (nonatomic, copy) NSString * playPathAacv164;
@property (nonatomic, copy) NSString * playUrl32;

@end
/*
 [0]    (null)    @"status" : (long)1
 [1]    (null)    @"title" : @"0001神奇的任务"
 [2]    (null)    @"isVideo" : (no summary)
 [3]    (null)    @"isRichAudio" : (no summary)
 [4]    (null)    @"duration" : (long)926
 [5]    (null)    @"processState" : (long)2
 [6]    (null)    @"nickname" : @"丸子"
 [7]    (null)    @"playPathHq" : @""
 [8]    (null)    @"coverMiddle" : @"http://fdfs.xmcdn.com/group3/M0A/52/67/wKgDsVNOUtHwREO4AARrkdpgrls996_web_large.jpg"
 [9]    (null)    @"isPaid" : (no summary)
 [10]    (null)    @"userSource" : (long)1
 [11]    (null)    @"likes" : (long)5329
 [12]    (null)    @"playPathAacv224" : @"http://audio.xmcdn.com/group8/M00/35/17/wKgDYFWUyWjwLLBuACu7DB7O1fI493.m4a"
 [13]    (null)    @"createdAt" : (long)1396550266000
 [14]    (null)    @"smallLogo" : @"http://fdfs.xmcdn.com/group3/M07/10/9D/wKgDsVMDVgmjQIegAAExEr5FcSo244_mobile_small.jpg"
 [15]    (null)    @"shares" : (long)0
 [16]    (null)    @"albumId" : (long)2799378
 [17]    (null)    @"playtimes" : (long)1682522
 [18]    (null)    @"playUrl64" : @"http://audio.xmcdn.com/group3/M09/58/B8/wKgDslNWHxjQJ2NLAHFMxNpYe9k714.mp3"
 [19]    (null)    @"playPathAacv164" : @"http://audio.xmcdn.com/group8/M00/35/48/wKgDYVWUyTaTmQ5OADurj-cYgjs535.m4a"
 [20]    (null)    @"playUrl32" : @"http://audio.xmcdn.com/group4/M00/44/CF/wKgDs1NWHziRZmTXADimuoEuY8g702.mp3"
 [21]    (null)    @"uid" : (long)4932085
 [22]    (null)    @"coverSmall" : @"http://fdfs.xmcdn.com/group3/M0A/52/67/wKgDsVNOUtHwREO4AARrkdpgrls996_web_meduim.jpg"
 [23]    (null)    @"coverLarge" : @"http://fdfs.xmcdn.com/group3/M0A/52/67/wKgDsVNOUtHwREO4AARrkdpgrls996_mobile_large.jpg"
 [24]    (null)    @"comments" : (long)1754
 [25]    (null)    @"trackId" : (long)2433093
 [26]    (null)    @"isDraft" : (no summary)
 [27]    (null)    @"opType" : (long)1
 [28]    (null)    @"isPublic" : (no summary)
 */
