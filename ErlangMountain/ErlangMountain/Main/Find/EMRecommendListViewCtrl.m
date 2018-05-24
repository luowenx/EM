//
//  EMRecommendListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/16.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendListViewCtrl.h"
#import "EMRecommendPageViewCtrl.h"
#import "EMAlbumDetailViewCtrl.h"

#import "EMRecommendListViewModel.h"

#import "EMRecommendDelegateObj.h"

#import "MCSAutoScrollView.h"

@interface EMRecommendListViewCtrl ()

@property (nonatomic, strong) EMRecommendListViewModel *viewModel;

@property (nonatomic, strong) MCSAutoScrollView *autoScrollView;

@property (nonatomic, strong) EMRecommendDelegateObj *delegateObj;

@end

@implementation EMRecommendListViewCtrl

-(void)dealloc
{
    [self.autoScrollView timerfree];
}

-(void)initViewModel
{
    self.viewModel  = [[EMRecommendListViewModel alloc] init];
    
    @weakify(self)
    [[RACObserve(self.viewModel, focusImages) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.autoScrollView reloadScrollData:(NSArray *)x];
        [self_weak_.autoScrollView timerStart];
    }];
    
    [[RACObserve(self.viewModel, hotRecommends) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
    self.viewModel.headerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ headerWith:(EMHeaderCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
    self.viewModel.moreRecommendCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMHotRecommendObj *input) {
        EMRecommendPageViewCtrl *pageViewCtrl = [[EMRecommendPageViewCtrl alloc] init];
        pageViewCtrl.recommendObj = input;
        pageViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:pageViewCtrl animated:YES];
        return [RACSignal empty];
    }];
    
    self.viewModel.didItemCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMRecommendItem *input) {
        EMAlbumDetailViewCtrl *detailViewCtrl = [[EMAlbumDetailViewCtrl alloc] init];
        detailViewCtrl.albumInfo = (EMAlbumBaseInfo *)input;
        detailViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}

-(void)initUI
{
    self.autoScrollView = [[MCSAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
}

-(void)initDelegate
{
    self.tableView.tableHeaderView = self.autoScrollView;
    @weakify(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self_weak_.viewModel fetchData];
    }];
    
    self.delegateObj = [[EMRecommendDelegateObj alloc] init];
    
    self.delegateObj.viewModel = self.viewModel;
    
    self.tableView.dataSource = self.delegateObj;
    self.tableView.delegate = self.delegateObj;
    self.autoScrollView.delegate = (id<AutoScrollDelegate>)self.delegateObj;
}

@end
