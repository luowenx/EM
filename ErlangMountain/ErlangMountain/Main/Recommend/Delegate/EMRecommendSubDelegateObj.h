//
//  EMRecommendSubDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 推荐更多子页代理对象
 */
@class EMRecommendSubViewModel;
@interface EMRecommendSubDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) EMRecommendSubViewModel * viewModel;

@end
