//
//  EMFollowListViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPeakAnchor.h"
/**
 关注列表
 */
@interface EMFollowListViewModel : EMViewModel

@property (nonatomic, strong, readonly) NSArray< EMPeakAnchor *> * dataArray;

/**  点击进入主播详情  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

/** 关注主播，参数类型 EMAnchor */
@property (nonatomic, strong) RACCommand *followCommand;

@end
