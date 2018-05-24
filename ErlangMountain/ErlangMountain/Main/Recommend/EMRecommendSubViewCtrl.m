//
//  EMRecommendSubViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendSubViewCtrl.h"
#import "EMAlbumDetailViewCtrl.h"

#import "EMRecommendSubViewModel.h"

#import "EMRecommendSubDelegateObj.h"

@interface EMRecommendSubViewCtrl ()

@property (nonatomic, strong) EMRecommendSubViewModel *viewModel;

@property (nonatomic, strong) EMRecommendSubDelegateObj * delegateObj;

@end

@implementation EMRecommendSubViewCtrl

-(void)initDelegate
{
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self_weak_.viewModel fetchData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self_weak_.viewModel loadMoreData];
    }];
    
    self.delegateObj = [[EMRecommendSubDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMRecommendSubViewModel alloc] initWithBookInfo:self.bookInfo];
    
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
    
    self.viewModel.didBookDetailCommend = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMBookDetailInfo *input) {
        EMAlbumDetailViewCtrl *detailViewCtrl = [[EMAlbumDetailViewCtrl alloc] init];
        detailViewCtrl.albumInfo = (EMAlbumBaseInfo *)input;
        detailViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}


@end
