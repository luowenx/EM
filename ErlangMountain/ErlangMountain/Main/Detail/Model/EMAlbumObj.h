//
//  EMAlbumObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumBaseInfo.h"

/**
 专辑对象
 */
@interface EMAlbumObj : EMAlbumBaseInfo
@property (nonatomic) NSInteger playTimes;
@property (nonatomic) long long  updatedAt;
@property (nonatomic) long long  createdAt;
@property (nonatomic) NSInteger categoryId;
@property (nonatomic) BOOL hasNew;
@property (nonatomic) NSInteger lastUptrackId;
@property (nonatomic) NSInteger serializeStatus;
@property (nonatomic) BOOL isFavorite;
@property (nonatomic) BOOL is_default;
@property (nonatomic) BOOL isVerified;
@property (nonatomic) NSInteger playTrackId;
@property (nonatomic) NSInteger shares;
@property (nonatomic) NSInteger unReadAlbumCommentCount;
@property (nonatomic) BOOL canShareAndStealListen;
@property (nonatomic) BOOL isRecordDesc;
@property (nonatomic) NSInteger offlineReason;
@property (nonatomic) NSInteger status;
@property (nonatomic) NSInteger followers;
@property (nonatomic) BOOL isDefault;
@property (nonatomic) BOOL canInviteListen;
@property (nonatomic) NSInteger offlineType;
@property (nonatomic) BOOL isFollowed;
@property (nonatomic) NSInteger shareSupportType;
@property (nonatomic) NSInteger saleScope;
@property (nonatomic) NSInteger vipFreeType;

@property (nonatomic, copy) NSString * shortIntro;
@property (nonatomic, copy) NSString * introRich;
@property (nonatomic, copy) NSString * coverLargePop;
@property (nonatomic, copy) NSString * categoryName;
@property (nonatomic, copy) NSString * lastUptrackTitle;
@property (nonatomic, copy) NSString * coverOrigin;
@property (nonatomic, copy) NSString * coverWebLarge;
@property (nonatomic, copy) NSString * shortIntroRich;
@property (nonatomic, copy) NSString * lastUptrackCoverPath;
@property (nonatomic, copy) NSString * avatarPath;
@property (nonatomic, copy) NSString * customSubTitle;

@end
/*
 [0]    (null)    @"playTimes" : (long)117261383
 [1]    (null)    @"updatedAt" : (long)1524073659000
 [2]    (null)    @"uid" : (long)4932085
 [3]    (null)    @"categoryId" : (long)3
 [4]    (null)    @"shortIntro" : @"《校花的贴身高手（下）》现已精彩上线，新专辑链接：http://www.ximalaya.com/493..."
 [5]    (null)    @"coverMiddle" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017_mobile_meduim.jpg"
 [6]    (null)    @"hasNew" : (no summary)
 [7]    (null)    @"lastUptrackId" : (long)21902925
 [8]    (null)    @"serializeStatus" : (long)0
 [9]    (null)    @"nickname" : @"丸子"
 [10]    (null)    @"introRich" : @"<p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\">《校花的贴身高手（下）》现已精彩上线，新专辑链接：http://www.ximalaya.com/4932085/album/5133474</p><p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\">也可以在丸子的新专辑中寻找。谢谢广大听友们的一贯支持。近期，为了回馈广大听友，新专辑即将打6.6折（原0.3元/集折后为0.2元/集），欢迎订阅。</p><p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\"><span>一个大山里走出来的绝世高手，一块能预知未来凶险的神秘玉佩…… 林逸是一名普通学生，不过，他还身负另外一个重任，那就是追校花！而且还是奉校花老爸之命！虽然林逸很不想跟这位难伺候的大小姐打交道，但是长辈之命难违抗，他不得不千里迢迢的转学到了松山市，给大小姐鞍前马后的当跟班……于是，史上最牛B的跟班出现了——大小姐的贴身高手！看这位跟班如何发家致富偷小姐，开始他奉旨泡妞牛X闪闪的人生……</span> </p>"
 [11]    (null)    @"isFavorite" : (no summary)
 [12]    (null)    @"is_default" : (no summary)
 [13]    (null)    @"isVerified" : (no summary)
 [14]    (null)    @"playTrackId" : (long)0
 [15]    (null)    @"shares" : (long)0
 [16]    (null)    @"coverLarge" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017_mobile_large.jpg"
 [17]    (null)    @"intro" : @"《校花的贴身高手（下）》现已精彩上线，新专辑链接：http://www.ximalaya.com/4932085/album/5133474 也可以在丸子的新专辑中寻找。谢谢广大听友们的一贯支持。近期，为了回馈广大听友，新专辑即将打6.6折（原0.3元/集折后为0.2元/集），欢迎订阅。 一个大山里走出来的绝世高手，一块能预知未来凶险的神秘玉佩…… 林逸是一名普通学生，不过，他还身负另外一个重任，那就是追校花！而且还是奉校花老爸之命！虽然林逸很不想跟这位难伺候的大小姐打交道，但是长辈之命难违抗，他不得不千里迢迢的转学到了松山市，给大小姐鞍前马后的当跟班……于是，史上最牛B的跟班出现了——大小姐的贴身高手！看这位跟班如何发家致富偷小姐，开始他奉旨泡妞牛X闪闪的人生……"
 [18]    (null)    @"coverLargePop" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017_large_pop.jpg"
 [19]    (null)    @"unReadAlbumCommentCount" : (long)0
 [20]    (null)    @"canShareAndStealListen" : (no summary)
 [21]    (null)    @"isRecordDesc" : (no summary)
 [22]    (null)    @"createdAt" : (long)1437476119000
 [23]    (null)    @"categoryName" : @"有声书"
 [24]    (null)    @"offlineReason" : (long)0
 [25]    (null)    @"lastUptrackTitle" : @"校花下部上线了，快来搜索吧"
 [26]    (null)    @"status" : (long)1
 [27]    (null)    @"serialState" : (long)0
 [28]    (null)    @"isPaid" : (no summary)
 [29]    (null)    @"followers" : (long)1427529
 [30]    (null)    @"lastUptrackAt" : (long)1474476092000
 [31]    (null)    @"coverOrigin" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017.jpg"
 [32]    (null)    @"tags" : @"奇幻,校园,玄幻,畅销书,科幻,校花的贴身高手上"
 [33]    (null)    @"isDefault" : (no summary)
 [34]    (null)    @"canInviteListen" : (no summary)
 [35]    (null)    @"offlineType" : (long)0
 [36]    (null)    @"albumId" : (long)2799378
 [37]    (null)    @"coverWebLarge" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017_web_large.jpg"
 [38]    (null)    @"tracks" : (long)791
 [39]    (null)    @"isDraft" : (no summary)
 [40]    (null)    @"isFollowed" : (no summary)
 [41]    (null)    @"shareSupportType" : (long)0
 [42]    (null)    @"saleScope" : (long)0
 [43]    (null)    @"vipFreeType" : (long)0
 [44]    (null)    @"title" : @"《校花的贴身高手》上"
 [45]    (null)    @"shortIntroRich" : @"<p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\">《校花的贴身高手（下）》现已精彩上线，新专辑链接：http://www.ximalaya.com/4932085/album/5133474</p><p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\">也可以在丸子的新专辑中寻找。谢谢广大听友们的一贯支持。近期，为了回馈广大听友，新专辑即将打6.6折（原0.3元/集折后为0.2元/集），欢迎订阅。</p><p data-flag=\"normal\" style=\"font-size:16px;color:#333333;line-height:30px;word-break:break-all;font-family:Helvetica,Arial,sans-serif;font-weight:normal\"><span>一个大山里走出来的绝世高手，一块能预知未来凶险的神秘玉佩…… 林逸是一名普通学生，不过，他还身负另外一个重任，那就是追校花！而且还是奉校花老爸之命！虽然林逸很不想跟这位难伺候的大小姐打交道，但是长辈之命难违抗，他不得不千里迢迢的转学到了松山市，给大小姐鞍前马后的当跟班……...</span></p><span style=\"display:none\" data-preview=\"true\"></span>"
 [46]    (null)    @"lastUptrackCoverPath" : @"group7/M07/4B/CA/wKgDWlWvCAKRNUGUAARrkdpgrls506.jpg"
 [47]    (null)    @"avatarPath" : @"http://fdfs.xmcdn.com/group3/M07/10/9D/wKgDsVMDVgmjQIegAAExEr5FcSo244_mobile_small.jpg"
 [48]    (null)    @"refundSupportType" : (long)0
 [49]    (null)    @"customSubTitle" : @"追校花的青春期才是完整的青春期"
 [50]    (null)    @"coverSmall" : @"http://fdfs.xmcdn.com/group3/M0A/52/2C/wKgDslNOUs-zACLmAARrkdpgrls017_mobile_small.jpg"
 */
