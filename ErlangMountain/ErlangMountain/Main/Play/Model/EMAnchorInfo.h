//
//  EMAnchorInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchor.h"

/**
 主播信息
 */
@interface EMAnchorInfo : EMAnchor
@property (nonatomic) NSInteger verifyType;
@property (nonatomic) NSInteger tracks;
@property (nonatomic) NSInteger anchorGrade;
@property (nonatomic) NSInteger albums;
@property (nonatomic) NSInteger followings;
@property (nonatomic) NSInteger followers;
@property (nonatomic) BOOL isVip;

@property (nonatomic, copy) NSString * personalSignature;
@property (nonatomic, copy) NSString * personDescribe;
@property (nonatomic, copy) NSString * ptitle;
@end

/*
 [0]    (null)    @"verifyType" : (long)2
 [1]    (null)    @"tracks" : (long)2970
 [2]    (null)    @"uid" : (long)14528933
 [3]    (null)    @"anchorGrade" : (long)14
 [4]    (null)    @"isVip" : (no summary)
 [5]    (null)    @"albums" : (long)27
 [6]    (null)    @"followings" : (long)182
 [7]    (null)    @"isFollowed" : (no summary)
 [8]    (null)    @"isVerified" : (no summary)
 [9]    (null)    @"smallLogo" : @"http://fdfs.xmcdn.com/group12/M05/74/56/wKgDW1dBXomxkXZNAAFCqXAuocw507_mobile_small.jpg"
 [10]    (null)    @"personalSignature" : @"用心吐字，用爱归音！每一部书都做精品！每部书都争取做的百听不厌！"
 [11]    (null)    @"followers" : (long)382711
 [12]    (null)    @"nickname" : @"全勇"
 [13]    (null)    @"personDescribe" : @"微信50239097纪录片专题片广告片配音，全勇 散文朗诵，小说播讲！"
 [14]    (null)    @"ptitle" : @"有声小说主播"
 */
