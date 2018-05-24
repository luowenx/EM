//
//  EMPeakAlbumInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumBaseInfo.h"

/**
 榜单专辑对象
 */
@interface EMPeakAlbumInfo : EMAlbumBaseInfo
@property (nonatomic) NSInteger lastUptrackId;
@property (nonatomic) long long  lastUptrackAt;
@property (nonatomic) NSInteger tracksCounts;
@property (nonatomic, copy) NSString *lastUptrackTitle;
@end

/*
 [0]    (null)    @"title" : @"晓说2017"
 [1]    (null)    @"tags" : @"高晓松,晓松奇谈,晓说"
 [2]    (null)    @"serialState" : (long)1
 [3]    (null)    @"nickname" : @"晓说2017"
 [4]    (null)    @"lastUptrackId" : (long)85192163
 [5]    (null)    @"coverMiddle" : @"http://fdfs.xmcdn.com/group41/M03/22/AD/wKgJ8lq8tEfRn1KnAAD3RcTQrRU315_mobile_meduim.jpg"
 [6]    (null)    @"playsCounts" : (long)1250325951
 [7]    (null)    @"intro" : @"【高晓松】谈笑风生，满是干货的谈资"
 [8]    (null)    @"isPaid" : (no summary)
 [9]    (null)    @"albumId" : (long)7651313
 [10]    (null)    @"lastUptrackAt" : (long)1524820915000
 [11]    (null)    @"id" : (long)7651313
 [12]    (null)    @"coverSmall" : @"http://fdfs.xmcdn.com/group41/M03/22/AD/wKgJ8lq8tEfRn1KnAAD3RcTQrRU315_mobile_small.jpg"
 [13]    (null)    @"tracksCounts" : (long)55
 [14]    (null)    @"uid" : (long)10936615
 [15]    (null)    @"tracks" : (long)55
 [16]    (null)    @"priceTypeId" : (long)0
 [17]    (null)    @"isFinished" : (long)1
 [18]    (null)    @"lastUptrackTitle" : @"晓说第55期：古代金融之二--央妈传奇"
 [19]    (null)    @"isDraft" : (no summary)
 [20]    (null)    @"isVipFree" : (no summary)
 [21]    (null)    @"albumCoverUrl290" : @"http://fdfs.xmcdn.com/group41/M03/22/AD/wKgJ8lq8tEfRn1KnAAD3RcTQrRU315_mobile_meduim.jpg"
 */
