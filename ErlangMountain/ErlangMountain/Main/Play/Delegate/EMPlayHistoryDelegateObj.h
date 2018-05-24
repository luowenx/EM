//
//  EMPlayHistoryDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 播放历史代理对象
 */
@class EMPlayHistoryViewModel;
@interface EMPlayHistoryDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMPlayHistoryViewModel *viewModel;

@end
