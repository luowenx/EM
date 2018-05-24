//
//  EMPlayHistoryManager.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMDataPersistence.h"

static NSInteger MaxHistoryCount = 50; // 最大历史数量

/**
 播放历史记录
 */
#define EMHistorys [EMPlayHistoryManager sharePersistence]
@class EMPlayItemInfo;
@interface EMPlayHistoryManager : EMDataPersistence

/** "add"、"remove" method may kvo */
@property (nonatomic, strong, readonly) NSMutableArray <EMPlayItemInfo*> *historyList;

/** 当前播放元素 */
@property (nonatomic, strong, readonly) EMPlayItemInfo *playItemInfo;

/**
 添加到历史
 */
-(void)addToHistory:(EMPlayItemInfo *)playItemInfo;

/**
 从播放历史移除
 @param playItemInfo 要移除的播放作品
 */
- (void)removeFromHistory:(EMPlayItemInfo *)playItemInfo;
-(void)removeAllHistory;
@end
