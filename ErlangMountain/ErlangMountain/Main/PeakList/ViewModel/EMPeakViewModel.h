//
//  EMPeakViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMPeakListObj.h"
#import "EMPeakAlbumInfo.h"

/**
 榜单详情
 */
@interface EMPeakViewModel : EMViewModel

@property (nonatomic, strong, readonly) NSMutableArray<EMPeakAlbumInfo *> * dataArray;
/**
 @param peakObj 榜单对象
 @return self
 */
- (instancetype)initWithPeakListObj:(EMPeakListObj *)peakObj;

/**  点击进入专辑详情  */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

@end
