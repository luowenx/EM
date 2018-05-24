//
//  EMPeakListDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 发现榜单代理对象
 只用于实现代理、传递事件，不处理逻辑
 */
@class EMPeakListViewModel;
@interface EMPeakListDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMPeakListViewModel * viewModel;

@end
