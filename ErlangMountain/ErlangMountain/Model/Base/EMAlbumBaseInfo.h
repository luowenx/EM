//
//  EMAlbumBaseInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 专辑基础信息
 */
@interface EMAlbumBaseInfo : NSObject<LQDecode, LQEncode, LQDataTransformation>

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * tags;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic, copy) NSString * coverMiddle;
@property (nonatomic, copy) NSString * coverSmall;
@property (nonatomic, copy) NSString * coverLarge;
@property (nonatomic, copy) NSString * albumCoverUrl290;
@property (nonatomic, copy) NSString * intro;
@property (nonatomic, copy) NSString * trackTitle;
@property (nonatomic, copy) NSString * provider;

@property (nonatomic) NSInteger serialState;
@property (nonatomic) NSInteger albumId;
@property (nonatomic) NSInteger uid;
@property (nonatomic) NSInteger id;
@property (nonatomic) long long playsCounts;
@property (nonatomic) NSInteger commentsCount;
@property (nonatomic) NSInteger tracks;
@property (nonatomic) BOOL isPaid;
@property (nonatomic) NSInteger refundSupportType;
@property (nonatomic) NSInteger priceTypeId;
@property (nonatomic) NSInteger isFinished_;
@property (nonatomic) NSInteger trackId;
@property (nonatomic) BOOL isVipFree;
@property (nonatomic) BOOL isDraft;

// 持久化数据
@property (nonatomic) BOOL isCollectioned;
@property (nonatomic) long long  lastUptrackAt;

@end
