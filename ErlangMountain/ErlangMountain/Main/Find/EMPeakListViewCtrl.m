//
//  EMPeakListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/16.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakListViewCtrl.h"
#import "EMPeakViewCtrl.h"
#import "EMPeakAnchorViewCtrl.h"

#import "EMPeakListViewModel.h"
#import "EMPeakListDelegateObj.h"
#import "EMPeakListObj.h"

#import "MCSAutoScrollView.h"

@interface EMPeakListViewCtrl ()

@property (nonatomic, strong) EMPeakListViewModel * viewModel;

@property (nonatomic, strong) MCSAutoScrollView *autoScrollView;

@property (nonatomic, strong) EMPeakListDelegateObj * delegateObj;

@end

@implementation EMPeakListViewCtrl

-(void)dealloc
{
    [self.autoScrollView timerfree];
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
    
    self.delegateObj = [[EMPeakListDelegateObj alloc] init];
    self.delegateObj.viewModel = self.viewModel;
    
    self.tableView.delegate = self.delegateObj;
    self.tableView.dataSource = self.delegateObj;
    
    self.autoScrollView.delegate = (id<AutoScrollDelegate>)self.delegateObj;
}

-(void)initViewModel
{
    self.viewModel = [[EMPeakListViewModel alloc] init];
    @weakify(self)
    [[RACObserve(self.viewModel, focusImages) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.autoScrollView reloadScrollData:(NSArray *)x];
        [self_weak_.autoScrollView timerStart];
    }];
    
    [[RACObserve(self.viewModel, dataArray) filter:^BOOL(id value) {
        return (!!value);
    }] subscribeNext:^(id x) {
        [self_weak_.tableView reloadData];
    }];
    
    self.viewModel.headerStatusCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        [self_weak_ headerWith:(EMHeaderCommendStatus)[input integerValue]];
        return [RACSignal empty];
    }];
    
    self.viewModel.didSelectRowCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMPeakListObj *input) {
        if ([input.contentType isEqualToString:@"album"]) {
            EMPeakViewCtrl *peakViewCtrl = [[EMPeakViewCtrl alloc] init];
            peakViewCtrl.hidesBottomBarWhenPushed = YES;
            peakViewCtrl.peakObj = input;
            [self_weak_.navigationController pushViewController:peakViewCtrl animated:YES];
        }else if ([input.contentType isEqualToString:@"anchor"]){
            EMPeakAnchorViewCtrl *anchorViewCtrl = [[EMPeakAnchorViewCtrl alloc] init];
            anchorViewCtrl.hidesBottomBarWhenPushed = YES;
            anchorViewCtrl.peakObj = input;
            [self_weak_.navigationController pushViewController:anchorViewCtrl animated:YES];
        }
        return [RACSignal empty];
    }];
}


@end
