//
//  EMRecommendDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 发现推荐代理对象
 只用于实现代理、传递事件，不处理逻辑
 */
@class EMRecommendListViewModel;
@interface EMRecommendDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMRecommendListViewModel * viewModel;

@end
