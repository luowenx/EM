//
//  EMPlayDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 播放页代理对象
 */
@class EMPlayViewModel;
@interface EMPlayDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMPlayViewModel *viewModel;

@end
