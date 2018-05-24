//
//  EMFollowListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFollowListViewCtrl.h"
#import "EMAnchorDetailViewCtrl.h"

#import "EMPeakAnchorDelegateObj.h"

#import "EMFollowListViewModel.h"

@interface EMFollowListViewCtrl ()

@property (nonatomic, strong) EMPeakAnchorDelegateObj *delegateObj;

@property (nonatomic, strong) EMFollowListViewModel *viewModel;

@end

@implementation EMFollowListViewCtrl

-(void)initUI
{
    self.navigationBarHidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.viewModel fetchData];
}

-(void)initDelegate
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self_weak_.viewModel fetchData];
    }];
    
    self.delegateObj = [[EMPeakAnchorDelegateObj alloc] init];
    self.delegateObj.viewModel = (EMPeakAnchorViewModel *)self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMFollowListViewModel alloc] init];
    
    @weakify(self)
    [[RACObserve(self.viewModel, dataArray) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
    self.viewModel.headerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ headerWith:(EMHeaderCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
    self.viewModel.didSelectRowCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        EMAnchorDetailViewCtrl *detailViewCtrl = [[EMAnchorDetailViewCtrl alloc] init];
        detailViewCtrl.anchor = input;
        detailViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}


@end
