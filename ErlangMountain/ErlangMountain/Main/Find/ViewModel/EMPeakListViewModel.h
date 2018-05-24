//
//  EMPeakListViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMFocuseImage.h"
#import "EMPeakGroupObj.h"

/**
 榜单
 */
@interface EMPeakListViewModel : EMViewModel
// --------------  data -----------------//
/** 轮播 */
@property (nonatomic, strong, readonly) NSArray <EMFocuseImage *>*focusImages;
/** 分组数据 */
@property (nonatomic, strong, readonly) NSArray <EMPeakGroupObj *>*dataArray;

/** 选中榜单对象 EMPeakListObj */
@property (nonatomic, strong) RACCommand *didSelectRowCommand;

@end
