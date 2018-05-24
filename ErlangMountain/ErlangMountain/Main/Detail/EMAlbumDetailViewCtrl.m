//
//  EMAlbumDetailViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumDetailViewCtrl.h"
#import "EMPlayViewCtrl.h"

#import "EMAlbumDetailHeaderView.h"

#import "EMAlbumDetailViewModel.h"

#import "EmAlbumDetailDelegateObj.h"

@interface EMAlbumDetailViewCtrl ()

@property (nonatomic, strong) EMAlbumDetailHeaderView * headerView;

@property (nonatomic, strong) EMAlbumDetailViewModel * viewModel;

@property (nonatomic, strong) EmAlbumDetailDelegateObj * delegateObj;

@end

@implementation EMAlbumDetailViewCtrl

-(void)initUI
{
    self.navigationBarHidden = YES;
    _headerView = [[EMAlbumDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), EMAlbumDetailHeaderView.defaultHeight)];
    [_headerView.backButton addTarget:self action:@selector(onBack) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)initDelegate
{
    self.tableView.tableHeaderView = self.headerView;
    
    @weakify(self)
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self_weak_.viewModel loadMoreData];
    }];
    
    self.delegateObj = [[EmAlbumDetailDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMAlbumDetailViewModel alloc] initWithAlbumInfo:self.albumInfo];
    
    @weakify(self)
    [[[RACObserve(self.viewModel, albumObj) filter:^BOOL(id value) {
        return !!(value);
    }] take:1] subscribeNext:^(EMAlbumObj *albumObj) {
        [self_weak_.headerView.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:albumObj.coverOrigin] placeholderImage:EMPublicPlaceholder_Small];
        
        [self_weak_.headerView.coverImageView sd_setImageWithURL:[NSURL URLWithString:albumObj.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
        
        [self_weak_.headerView.avatarImagView sd_setImageWithURL:[NSURL URLWithString:albumObj.avatarPath] placeholderImage:EMPublicPlaceholder_Small];
    }];
    
    RAC(self.headerView.titleLabel, text) = RACObserve(self.viewModel, albumObj.nickname);
    RAC(self.headerView.contentLabel, text) = RACObserve(self.viewModel, albumObj.intro);
    RAC(self.headerView.collectionButton, selected) = RACObserve(self.viewModel, isCollectioned);
    self.headerView.collectionButton.rac_command = self.viewModel.collectionCommand;

    [[RACObserve(self.viewModel, dataArray) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
    self.viewModel.didWorkCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMPlayItemInfo* input) {
        NSInteger loc = [self_weak_.viewModel.dataArray indexOfObject:input];
        NSInteger len = self_weak_.viewModel.dataArray.count - loc;
        NSArray *items = [self_weak_.viewModel.dataArray subarrayWithRange:NSMakeRange(loc, len)];
        [EMPlayViewCtrl presentPlayViewCtrlInTarget:self_weak_ playInfo:items];
        return [RACSignal empty];
    }];
    
    self.viewModel.footerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ footerWith:(EMFooterCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
}

@end
