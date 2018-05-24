//
//  EMHistoryPlayViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMHistoryPlayViewCtrl.h"
#import "EMPlayHistoryDelegateObj.h"
#import "EMPlayHistoryViewModel.h"

@interface EMHistoryPlayViewCtrl ()

@property (nonatomic, strong) EMPlayHistoryDelegateObj * delegateObj;

@property (nonatomic, strong) EMPlayHistoryViewModel * viewModel;

@end

@implementation EMHistoryPlayViewCtrl

-(void)initUI
{
    self.title = @"播放历史";
    @weakify(self)
    [self addRightNavWithTitle:@"清空" hander:^{
        @strongify(self)
        [self alertViewShowWithTitle:nil
                                   message:@"是否清空播放历史？"
                                    cancel:@"取消"
                                     other:@"确定"
                              clickedBlock:^(BOOL isTrue) {
                                  if (isTrue) {
                                      [self.viewModel.removeAllCommand execute:nil];
                                  }
                              }];
    }];
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
