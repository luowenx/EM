//
//  EMFieryListViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMFieryListObj.h"

/**
 发现--主播列表
 */
@interface EMFieryListViewModel : EMViewModel
// --------------  data -----------------//
/** 每一行的数据 */
@property (nonatomic, strong, readonly) NSMutableArray<EMFieryListObj *> * dataArray;

/** 更多主播，参数类型 EMFieryListObj */
@property (nonatomic, strong) RACCommand *moreListCommand;

/** 关注主播，参数类型 EMAnchor */
@property (nonatomic, strong) RACCommand *followCommand;

/** 主播详情，参数类型 EMAnchor */
@property (nonatomic, strong) RACCommand *didAnchorCommand;

@end
