//
//  EMAlbumDetailViewCtrl.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQTableViewCtrl.h"

/**
 专辑详情
 */
@class EMAlbumBaseInfo;
@interface EMAlbumDetailViewCtrl : LQTableViewCtrl

@property (nonatomic, strong) EMAlbumBaseInfo *albumInfo;

@end
