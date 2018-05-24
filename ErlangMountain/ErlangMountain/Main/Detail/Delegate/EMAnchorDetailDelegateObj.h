//
//  EMAnchorDtailDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 主播详情
 */
@class EMAnchorDetailViewModel;
@interface EMAnchorDetailDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMAnchorDetailViewModel * viewModel;

@end
