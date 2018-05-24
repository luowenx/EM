//
//  EMRecommendPageViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendPageViewCtrl.h"
#import "EMRecommendSubViewCtrl.h"

#import "EMRecommendPageViewModel.h"

#import "EMHotRecommendObj.h"

#import "SGPagingView.h"

@interface EMRecommendPageViewCtrl ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;

@property (nonatomic, strong) EMRecommendPageViewModel *viewModel;

@end

@implementation EMRecommendPageViewCtrl

-(void)initUI
{
    self.title = self.recommendObj.title;
}

-(void)initViewModel
{
    self.viewModel = [[EMRecommendPageViewModel alloc] initWithHotRecommend:self.recommendObj];
    
    @weakify(self)
    [[[RACObserve(self.viewModel, categorys) filter:^BOOL(id value) {
        return (!!value);
    }] take:1] subscribeNext:^(id x) {
        [self_weak_ initPageView];
    }];
    
}


-(void)initPageView
{
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor flsMainColor2];
    configure.indicatorColor = [UIColor flsMainColor2];
    configure.indicatorAdditionalWidth = 100;
    
    _pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 36)
                                                    delegate:self
                                                  titleNames:[self.viewModel.categorys valueForKeyPath:@"tname"]
                                                   configure:configure];
    [self.view addSubview:_pageTitleView];
    _pageTitleView.selectedIndex = 0;
    
    
    NSMutableArray *viewCtrls = [NSMutableArray arrayWithCapacity:self.viewModel.categorys.count];
    [self.viewModel.categorys enumerateObjectsUsingBlock:^(EMBookBaseInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        EMRecommendSubViewCtrl *subViewCtrl = [[EMRecommendSubViewCtrl alloc] init];
        subViewCtrl.bookInfo = obj;
        [viewCtrls addObject:subViewCtrl];
    }];
    
    CGFloat contentViewHeight = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(_pageTitleView.frame);
    _pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), CGRectGetWidth(self.view.frame), contentViewHeight)
                                                                         parentVC:self
                                                                         childVCs:viewCtrls];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
}

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    pageTitleView.selectedIndex = selectedIndex;
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
    if(progress>=1){
        _pageTitleView.selectedIndex = targetIndex;
    }
}


@end
