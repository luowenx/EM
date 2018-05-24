//
//  EMCollectionListViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMAlbumBaseInfo.h"

/**
 专辑收藏列表
 */
@interface EMCollectionListViewModel : EMViewModel

@property (nonatomic, strong, readonly) NSArray< EMAlbumBaseInfo *> * dataArray;

/**  点击进入专辑详情  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

@end
