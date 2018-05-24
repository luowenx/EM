//
//  EMHotAnchorViewCtrl.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQTableViewCtrl.h"

/**
 火热主播更多列表
 */
@class EMFieryListObj;
@interface EMHotAnchorViewCtrl : LQTableViewCtrl
/** 火热主播分类对象 */
@property (nonatomic, strong) EMFieryListObj * fieryObj;

@end
