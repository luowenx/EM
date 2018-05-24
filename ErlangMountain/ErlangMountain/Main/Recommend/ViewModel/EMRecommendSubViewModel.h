//
//  EMRecommendSubViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMBookDetailInfo.h"

/**
 发现-- 推荐 -- 更多-子页
 */
@class EMBookBaseInfo;
@interface EMRecommendSubViewModel : EMViewModel

/**
 初始化 需要给一个 EMBookDetailInfo的上行
 @param bookInfo EMBookDetailInfo
 @return self
 */
- (instancetype)initWithBookInfo:(EMBookBaseInfo *)bookInfo;

// --------------  data -----------------//
@property (nonatomic, strong, readonly) NSMutableArray<EMBookDetailInfo *> * dataArray;

// --------------  command -----------------//
// 进入详情页- - 参数类型 EMBookDetailInfo
@property (nonatomic, strong) RACCommand *didBookDetailCommend;

@end
