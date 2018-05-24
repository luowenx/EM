//
//  EMPeakAnchorViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPeakListObj.h"
#import "EMPeakAnchor.h"
/**
 榜单 -- 主播
 */
@interface EMPeakAnchorViewModel : EMViewModel

@property (nonatomic, strong, readonly) NSMutableArray< EMPeakAnchor *> * dataArray;

/**
 @param peakObj 榜单对象
 @return self
 */
- (instancetype)initWithPeakListObj:(EMPeakListObj *)peakObj;

/**  点击进入主播详情  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

/** 关注主播，参数类型 EMAnchor */
@property (nonatomic, strong) RACCommand *followCommand;

@end
