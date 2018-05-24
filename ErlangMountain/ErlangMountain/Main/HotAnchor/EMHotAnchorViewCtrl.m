//
//  EMHotAnchorViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMHotAnchorViewCtrl.h"
#import "EMAnchorDetailViewCtrl.h"

#import "EMHotAnchorViewModel.h"

#import "EMHotAnchorDelegateObj.h"

@interface EMHotAnchorViewCtrl ()

@property (nonatomic, strong) EMHotAnchorViewModel *viewModel;

@property (nonatomic, strong) EMHotAnchorDelegateObj * delegateObj;

@end

@implementation EMHotAnchorViewCtrl

-(void)initUI
{
    self.title = self.fieryObj.title;
}

-(void)initDelegate
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self_weak_.viewModel fetchData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self_weak_.viewModel loadMoreData];
    }];
    
    self.delegateObj = [[EMHotAnchorDelegateObj alloc] init];
    self.delegateObj.viewModel = (EMPeakAnchorViewModel *)self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMHotAnchorViewModel alloc] initWithFieryListObj:self.fieryObj];
    
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
    
    self.viewModel.didSelectRowCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        EMAnchorDetailViewCtrl *detailViewCtrl = [[EMAnchorDetailViewCtrl alloc] init];
        detailViewCtrl.anchor = input;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}



@end
