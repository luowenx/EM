//
//  EMAnchor.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主播对象
 */
@interface EMAnchor : NSObject<LQDecode, LQEncode, LQDataTransformation>

@property (nonatomic, copy) NSString * smallLogo;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic) BOOL isVerified;
@property (nonatomic) NSInteger uid;

// 非网络数据
@property (nonatomic) BOOL isFollowed;

@end

/*
 [0]    (null)    @"smallLogo" : @"http://fdfs.xmcdn.com/group40/M07/FC/D5/wKgJVFq95VzQjr-1AAFSRTSWXJM921_web_x_large.jpg"
 [1]    (null)    @"uid" : (long)108687108
 [2]    (null)    @"nickname" : @"竞彩电台"
 [3]    (null)    @"isVerified" : (no summary)
 */
