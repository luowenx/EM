//
//  EMCollectionDelegateObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 收藏
 */
@class EMCollectionListViewModel;
@interface EMCollectionDelegateObj : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) EMCollectionListViewModel * viewModel;
@end
