//
//  EMHotAnchorViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPeakAnchor.h"
#import "EMFieryListObj.h"

/**
 热门主播
 */
@interface EMHotAnchorViewModel : EMViewModel
@property (nonatomic, strong, readonly) NSMutableArray< EMPeakAnchor *> * dataArray;

/**
 @param fieryObj 主播分类对象
 @return self
 */
- (instancetype)initWithFieryListObj:(EMFieryListObj *)fieryObj;

/** 关注主播，参数类型 EMAnchor */
@property (nonatomic, strong) RACCommand *followCommand;

/**  点击进入主播详情  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

@end
