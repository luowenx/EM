//
//  EMCollectonListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCollectonListViewCtrl.h"
#import "EMAlbumDetailViewCtrl.h"

#import "EMCollectionListViewModel.h"

#import "EMCollectionDelegateObj.h"

@interface EMCollectonListViewCtrl ()

@property (nonatomic, strong) EMCollectionListViewModel *viewModel;

@property (nonatomic, strong) EMCollectionDelegateObj *delegateObj;
@end

@implementation EMCollectonListViewCtrl

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
    
    self.delegateObj = [[EMCollectionDelegateObj alloc] init];
    self.delegateObj.viewModel = (EMCollectionListViewModel *)self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}


-(void)initViewModel
{
    self.viewModel = [[EMCollectionListViewModel alloc] init];
    
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
        EMAlbumDetailViewCtrl *detailViewCtrl = [[EMAlbumDetailViewCtrl alloc] init];
        detailViewCtrl.albumInfo = input;
        detailViewCtrl.hidesBottomBarWhenPushed = YES;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
}

@end
