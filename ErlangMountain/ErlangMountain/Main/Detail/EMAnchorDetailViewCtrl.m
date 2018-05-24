//
//  EMAnchorDetailViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDetailViewCtrl.h"
#import "EMAlbumDetailViewCtrl.h"

#import "EMAnchorDetailHeaderView.h"

#import "EMAnchorDetailViewModel.h"

#import "EMAnchorDetailDelegateObj.h"

@interface EMAnchorDetailViewCtrl ()

@property (nonatomic, strong) EMAnchorDetailHeaderView * headerView;

@property (nonatomic, strong) EMAnchorDetailViewModel *viewModel;

@property (nonatomic, strong) EMAnchorDetailDelegateObj *delegateObj;

@end

@implementation EMAnchorDetailViewCtrl

-(void)initUI
{
    self.navigationBarHidden = YES;
    self.headerView = [[EMAnchorDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), [EMAnchorDetailHeaderView defaultHeight])];
    [self.headerView.backButton addTarget:self action:@selector(onBack) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)initDelegate
{
    self.tableView.tableHeaderView = self.headerView;
    
    @weakify(self)
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self_weak_.viewModel loadMoreData];
    }];
    
    self.delegateObj = [[EMAnchorDetailDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMAnchorDetailViewModel alloc] initWithAnchor:self.anchor];
    
    @weakify(self)
    [RACObserve(self.viewModel, anchorDtailInfo) subscribeNext:^(EMAnchorDtailInfo *x) {
        @strongify(self)
        [self.headerView.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:x.backgroundLogo]];
        [self.headerView.imageView sd_setImageWithURL:[NSURL URLWithString:x.mobileMiddleLogo] placeholderImage:EMPublicPlaceholder_Icon];
        self.headerView.nickNameLabel.text = x.nickname;
        self.headerView.describeLabel.text = x.personDescribe;
        self.headerView.followNumLabel.text = [@(x.followings) asNSString];
        self.headerView.fansNumLabel.text = [@(x.followers) asNSString];
        self.headerView.likeNumLabel.text = [@(x.favorites) asNSString];
    }];
    
    self.headerView.followButton.rac_command = self.viewModel.followCommand;
    RAC(self.headerView.followButton, selected) = RACObserve(self.viewModel, isFollowed);
    
    [[RACObserve(self.viewModel, dataArray) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];

    self.viewModel.footerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ footerWith:(EMFooterCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
    self.viewModel.didSelectRowCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        EMAlbumDetailViewCtrl *detailViewCtrl = [[EMAlbumDetailViewCtrl alloc] init];
        detailViewCtrl.albumInfo = (EMAlbumBaseInfo *)input;
        [self_weak_.navigationController pushViewController:detailViewCtrl animated:YES];
        return [RACSignal empty];
    }];
    
}

@end
