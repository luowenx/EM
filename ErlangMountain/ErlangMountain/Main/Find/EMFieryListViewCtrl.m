//
//  EmFieryListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/16.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryListViewCtrl.h"
#import "EMHotAnchorViewCtrl.h"
#import "EMAnchorDetailViewCtrl.h"

#import "EMFieryListViewModel.h"

#import "EMFieryListDelegateObj.h"

@interface EMFieryListViewCtrl ()

@property (nonatomic, strong) EMFieryListViewModel * viewModel;

@property (nonatomic, strong) EMFieryListDelegateObj * fieryDelegate;

@end

@implementation EMFieryListViewCtrl

-(void)initDelegate
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self_weak_.viewModel fetchData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self_weak_.viewModel loadMoreData];
    }];
    
    self.fieryDelegate = [[EMFieryListDelegateObj alloc] init];
    self.fieryDelegate.viewModel = self.viewModel;
    
    self.tableView.delegate = self.fieryDelegate;
    self.tableView.dataSource = self.fieryDelegate;
}

-(void)initViewModel
{
    self.viewModel = [[EMFieryListViewModel alloc] init];
    
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
    
    self.viewModel.footerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ footerWith:(EMFooterCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
    self.viewModel.moreListCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        EMHotAnchorViewCtrl *hotAnchorViewCtrl = [[EMHotAnchorViewCtrl alloc] init];
        hotAnchorViewCtrl.fieryObj = (EMFieryListObj *)input;
        hotAnchorViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:hotAnchorViewCtrl animated:YES];
        return [RACSignal empty];
    }];
    
    self.viewModel.didAnchorCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        EMAnchorDetailViewCtrl *anchorDetailViewCtrl = [[EMAnchorDetailViewCtrl alloc] init];
        anchorDetailViewCtrl.hidesBottomBarWhenPushed = YES;
        anchorDetailViewCtrl.anchor = input;
        [self_weak_.navigationController pushViewController:anchorDetailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}

@end
