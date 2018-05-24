//
//  EMPlayViewCtrl.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQTableViewCtrl.h"

/**
 播放页
 */
@class EMPlayItemInfo;
@interface EMPlayViewCtrl : LQTableViewCtrl

/**
 作品对象列表， 必传
 */
@property (nonatomic, strong) NSArray<EMPlayItemInfo*> *playInfos;

/**
 present 方式弹出播放页

 @param target 弹起控制器
 @param playInfos 参数
 @return self
 */
+(instancetype)presentPlayViewCtrlInTarget:(LQBaseViewCtrl *)target
                                  playInfo:(NSArray<EMPlayItemInfo*> *)playInfos;

@end
