//
//  EMAlbumDetailViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMAlbumObj.h"
#import "EMPlayItemInfo.h"

/**
 专辑详情
 */
@class EMAlbumBaseInfo;
@interface EMAlbumDetailViewModel : EMViewModel

/**
 需要一个 EMAlbumBaseInfo类型的参数
 @param albumInfo  EMAlbumBaseInfo
 @return self
 */
- (instancetype)initWithAlbumInfo:(EMAlbumBaseInfo *)albumInfo;

// --------------  data -----------------//
@property (nonatomic, strong, readonly) EMAlbumObj * albumObj;

@property (nonatomic, strong, readonly) NSMutableArray<EMPlayItemInfo *> * dataArray;

@property (nonatomic, readonly) BOOL isCollectioned;

/* 去播放作品 参数类型为 EMPlayItemInfo */
@property (nonatomic, strong) RACCommand *didWorkCommand;
/* 收藏  */
@property (nonatomic, strong) RACCommand *collectionCommand;
@end
