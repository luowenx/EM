//
//  EMPlayViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayViewCtrl.h"
#import "EMNavigationCtrl.h"
#import "EMPlayListViewCtrl.h"
#import "EMHistoryPlayViewCtrl.h"

#import "EMPlayDelegateObj.h"

#import "EMPlayViewModel.h"

#import "EMPlayHeaderView.h"

#import "EMPlayItemInfo.h"
#import "EMPlayHistoryManager.h"

@interface EMPlayViewCtrl ()

@property (nonatomic, strong) EMPlayDelegateObj *delegateObj;

@property (nonatomic, strong) EMPlayHeaderView *headerView;

@property (nonatomic, strong) EMPlayViewModel *viewModel;

@end

@implementation EMPlayViewCtrl

- (void)initUI
{
    self.navigationBarHidden = YES;
    self.headerView = [[EMPlayHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), [EMPlayHeaderView defaultHeight])];
    [self.headerView.backButton addTarget:self action:@selector(onBack) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)initDelegate
{
    self.tableView.tableHeaderView = self.headerView;
    self.delegateObj = [[EMPlayDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
}

- (void)initViewModel
{
    self.viewModel = [EMPlayViewModel shareInstance];
    
    if (self.playInfos.count) {
        [self.viewModel resetPlayList:self.playInfos];
    }else{
        if (EMHistorys.playItemInfo) {
            [self.viewModel resetPlayList:@[EMHistorys.playItemInfo]];
        }
    }

    self.headerView.runButton.rac_command = self.viewModel.playCommand;
    self.headerView.previousButton.rac_command = self.viewModel.previousCommand;
    self.headerView.nextButton.rac_command = self.viewModel.nextCommand;

    RAC(self.headerView.runButton, selected) = RACObserve(self.viewModel, isPlaying);
    
    @weakify(self)
    [RACObserve(self.viewModel, playItemInfo) subscribeNext:^(id x) {
        @strongify(self)
        EMPlayItemInfo *itemInfo = (EMPlayItemInfo*)x;
        [self.headerView.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:itemInfo.coverLarge] placeholderImage:EMPublicPlaceholder_Small];
        [self.headerView.coverImageView sd_setImageWithURL:[NSURL URLWithString:itemInfo.coverLarge] placeholderImage:EMPublicPlaceholder_Small];
        self.headerView.titleLabel.text = itemInfo.title;
        self.headerView.slider.maximumValue = itemInfo.duration;
        self.headerView.totalTimeLabel.text = [NSString stringWithFormat:@"%02ld:%02ld", itemInfo.duration/60, itemInfo.duration%60];
    }];
    
    [RACObserve(self.viewModel, detailObj) subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
    RAC(self.headerView.slider, value) = [RACObserve(self.viewModel, currentTime) filter:^BOOL(id value) {
        @strongify(self)
        return !self.headerView.slider.isTracking;
    }];
    RAC(self.headerView.currentTimeLabel, text) = [RACObserve(self.viewModel, currentTime) map:^id(id value) {
        NSInteger currentTime = [value asInteger];
        return [NSString stringWithFormat:@"%02ld:%02ld", currentTime/60, currentTime%60];
    }];

    [[[self.headerView.slider rac_signalForControlEvents:(UIControlEventValueChanged)] map:^id(UISlider * value) {
        return @(value.value);
    }] subscribeNext:^(id x) {
        @strongify(self)
        [self.viewModel seekToTime:[x floatValue]];
    }];
    
    [[self.headerView.openListButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        @strongify(self)
        EMPlayListViewCtrl *playListViewCtrl = [[EMPlayListViewCtrl alloc] init];
        EMNavigationCtrl *naViewCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:playListViewCtrl];
        playListViewCtrl.didSelectRow = ^(EMPlayItemInfo *item) {
            [self.viewModel playWithPlayItemInfo:item];
        };
        playListViewCtrl.playList = self.viewModel.playList.copy;
        [self presentViewController:naViewCtrl animated:YES completion:nil];
    }];
    
    [[self.headerView.historyButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        @strongify(self)
        EMHistoryPlayViewCtrl *historyViewCtrl = [[EMHistoryPlayViewCtrl alloc] init];
        EMNavigationCtrl *naViewCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:historyViewCtrl];
        [self presentViewController:naViewCtrl animated:YES completion:nil];
    }];
}

+ (instancetype)presentPlayViewCtrlInTarget:(LQBaseViewCtrl *)target playInfo:(NSArray<EMPlayItemInfo *> *)playInfos
{
    EMPlayViewCtrl *playViewCtrl = [[EMPlayViewCtrl alloc] init];
    playViewCtrl.playInfos = playInfos.copy;
    EMNavigationCtrl *naViewCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:playViewCtrl];
    [target presentViewController:naViewCtrl animated:YES completion:nil];
    return playViewCtrl;
}

@end
