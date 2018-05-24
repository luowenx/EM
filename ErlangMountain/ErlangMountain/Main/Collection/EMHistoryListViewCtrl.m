//
//  EMHistoryListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMHistoryListViewCtrl.h"

#import "EMPlayHistoryDelegateObj.h"

#import "EMPlayHistoryViewModel.h"

@interface EMHistoryListViewCtrl ()

@property (nonatomic, strong) EMPlayHistoryDelegateObj * delegateObj;

@property (nonatomic, strong) EMPlayHistoryViewModel * viewModel;

@end

@implementation EMHistoryListViewCtrl

-(void)initUI
{
    self.navigationBarHidden = YES;
}

-(void)initDelegate
{
    self.delegateObj = [[EMPlayHistoryDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMPlayHistoryViewModel alloc] init];
    
    @weakify(self)
    [RACObserve(self.viewModel, dataArray) subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
}

@end
