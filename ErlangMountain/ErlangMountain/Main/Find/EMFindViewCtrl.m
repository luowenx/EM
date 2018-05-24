//
//  EMFindViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFindViewCtrl.h"
#import "EMPeakListViewCtrl.h"
#import "EMFieryListViewCtrl.h"
#import "EMRecommendListViewCtrl.h"

#import "SGPagingView.h"

@interface EMFindViewCtrl ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;

@end

@implementation EMFindViewCtrl

-(void)initUI
{
    self.title = @"发现";

    [self addLeftNavWithImageName:nil hander:nil];
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor flsMainColor2];
    configure.indicatorColor = [UIColor flsMainColor2];
    configure.indicatorAdditionalWidth = 100;
    
    SGPageTitleView *pageView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 36)
                                                               delegate:self
                                                             titleNames:@[@"推荐新奇", @"巅峰榜单",  @"火热主播"]
                                                              configure:configure];
    [self.view addSubview:pageView];
    pageView.selectedIndex = 0;
    _pageTitleView = pageView;
    
    EMRecommendListViewCtrl *recommendListViewCtrl = [[EMRecommendListViewCtrl alloc] init];
    EMPeakListViewCtrl *peakListViewCtrl = [[EMPeakListViewCtrl alloc] init];
    EMFieryListViewCtrl *fieryListViewCtrl = [[EMFieryListViewCtrl alloc] init];
    CGFloat contentViewHeight = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(pageView.frame) - kLQTabarHeight -kLQNavANDStatusBarHeight;
    
    SGPageContentView *pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(pageView.frame), CGRectGetWidth(self.view.frame), contentViewHeight)
                                                                         parentVC:self
                                                                         childVCs:@[recommendListViewCtrl, peakListViewCtrl, fieryListViewCtrl]];
    pageContentView.delegatePageContentView = self;
    [self.view addSubview:pageContentView];
    _pageContentView = pageContentView;
}

-(void)initViewModel
{

}

#pragma mark === SGPageTitleViewDelegate, SGPageContentViewDelegate

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
