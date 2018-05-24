//
//  EMPeakViewCtrl.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQTableViewCtrl.h"

/**
 巅峰榜单详情
 */
@class EMPeakListObj;
@interface EMPeakViewCtrl : LQTableViewCtrl

@property (nonatomic, strong) EMPeakListObj * peakObj;

@end
