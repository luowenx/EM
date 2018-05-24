//
//  EMPeakAnchorViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakAnchorViewCtrl.h"
#import "EMAnchorDetailViewCtrl.h"

#import "EMPeakAnchorViewModel.h"

#import "EMPeakAnchorDelegateObj.h"

@interface EMPeakAnchorViewCtrl ()

@property (nonatomic, strong) EMPeakAnchorViewModel *viewModel;

@property (nonatomic, strong) EMPeakAnchorDelegateObj *delegateObj;

@end

@implementation EMPeakAnchorViewCtrl

-(void)initUI
{
    self.title = self.peakObj.title;
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
    
    self.delegateObj = [[EMPeakAnchorDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}


-(void)initViewModel
{
    self.viewModel = [[EMPeakAnchorViewModel alloc] initWithPeakListObj:self.peakObj];
    
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
