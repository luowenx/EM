//
//  EMPeakDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 榜单专辑
 */
@class EMPeakViewModel;
@interface EMPeakDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMPeakViewModel * viewModel;

@end
