//
//  EMAnchorDetailViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPeakAnchor.h"
#import "EMAnchorDtailInfo.h"
#import "EMAnchorAlbumObj.h"

/**
 主播详情
 */
@interface EMAnchorDetailViewModel : EMViewModel

/** 主播详细信息 */
@property (nonatomic, strong, readonly) EMAnchorDtailInfo *anchorDtailInfo;
/**  专辑数据  */
@property (nonatomic, strong, readonly) NSMutableArray<EMAnchorAlbumObj *> * dataArray;
/**  专辑总数  */
@property (nonatomic, readonly) NSInteger totalCount;
/**  是否关注  */
@property (nonatomic, readonly) BOOL isFollowed;
/**  关注  */
@property (nonatomic, strong, readonly) RACCommand *followCommand;
/**  点击进入专辑详情，参数EMAnchorAlbumObj类型  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

/**
 初始化
 @param anchor 主播基本信息
 @return self
 */
- (instancetype)initWithAnchor:(EMAnchor*)anchor;
@end
