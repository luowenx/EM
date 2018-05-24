//
//  EMPeakAnchor.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchor.h"

/**
 榜单主播
 */
@interface EMPeakAnchor : EMAnchor
@property (nonatomic, copy) NSString * verifyTitle;
@property (nonatomic, copy) NSString * largeLogo;
@property (nonatomic, copy) NSString * middleLogo;
@property (nonatomic, copy) NSString * userGrade;
@property (nonatomic, copy) NSString * personDescribe;
@property (nonatomic, copy) NSString * verifyType;

@property (nonatomic) NSInteger tracksCounts;
@property (nonatomic) NSInteger followersCounts;
@property (nonatomic) NSInteger anchorGrade;

@end

/*
 [0]    (null)    @"verifyTitle" : @"喜马拉雅音乐人"
 [1]    (null)    @"uid" : (long)7178199
 [2]    (null)    @"largeLogo" : @"http://fdfs.xmcdn.com/group37/M02/4C/D9/wKgJoVpJzEiAlEjBAAN0VDg5JX4799_mobile_x_large.jpg"
 [3]    (null)    @"tracksCounts" : (long)75
 [4]    (null)    @"followersCounts" : (long)332175
 [5]    (null)    @"anchorGrade" : (long)12
 [6]    (null)    @"isVerified" : (no summary)
 [7]    (null)    @"smallLogo" : @"http://fdfs.xmcdn.com/group37/M02/4C/D9/wKgJoVpJzEiAlEjBAAN0VDg5JX4799_mobile_small.jpg"
 [8]    (null)    @"userGrade" : (long)72057594037927935
 [9]    (null)    @"nickname" : @"徐薇_薇薇薇"
 [10]    (null)    @"middleLogo" : @"http://fdfs.xmcdn.com/group37/M02/4C/D9/wKgJoVpJzEiAlEjBAAN0VDg5JX4799_web_x_large.jpg"
 [11]    (null)    @"personDescribe" : @"翻唱达人，情歌女神"
 [12]    (null)    @"verifyType" : (long)1
 */
