//
//  EMRecommendPageViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"

/**
 发现-- 推荐 -- 更多
 */
@class EMHotRecommendObj, EMBookBaseInfo;
@interface EMRecommendPageViewModel : EMViewModel
/**
 必须给一个 EMHotRecommendObj 提供上行参数
 @param hotRecommend EMHotRecommendObj类型对象
 @return self
 */
- (instancetype)initWithHotRecommend:(EMHotRecommendObj *)hotRecommend;

// --------------  data -----------------//
@property (nonatomic, strong, readonly) NSArray<EMBookBaseInfo *> * categorys;


@end
