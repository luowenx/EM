//
//  EMPlayListViewCtrl.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQTableViewCtrl.h"


/**
 播放列表
 */
@class EMPlayItemInfo;
@interface EMPlayListViewCtrl : LQTableViewCtrl

/** 需要显示的数据源 */
@property (nonatomic, strong) NSArray<EMPlayItemInfo *> * playList;

/** 播放 */
@property (nonatomic, copy) void (^didSelectRow)(EMPlayItemInfo *item);
@end
