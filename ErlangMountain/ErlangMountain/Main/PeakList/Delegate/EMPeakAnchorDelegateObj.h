//
//  EMPeakAnchorDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主播榜单
 如果复用此代理对象，请注意 viewModel 的参数
 */
@class EMPeakAnchorViewModel;
@interface EMPeakAnchorDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMPeakAnchorViewModel *viewModel;

@end
