//
//  EMPlayHistoryViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPlayItemInfo.h"
/**
 播放历史
 */
@interface EMPlayHistoryViewModel : EMViewModel

@property (nonatomic, strong, readonly) NSArray<EMPlayItemInfo *> *dataArray;

/** 播放历史作品 EMPlayItemInfo  */
@property (nonatomic, strong) RACCommand *playCommand;
@property (nonatomic, strong) RACCommand *removeCommand;
@property (nonatomic, strong) RACCommand *removeAllCommand;

@end
