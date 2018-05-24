//
//  EMCollectionViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCollectionViewCtrl.h"
#import "EMHistoryListViewCtrl.h"
#import "EMFollowListViewCtrl.h"
#import "EMCollectonListViewCtrl.h"

#import "SGPagingView.h"


@interface EMCollectionViewCtrl ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;

@end

@implementation EMCollectionViewCtrl


-(void)initUI
{
    self.navigationBarHidden = YES;
    
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = [UIColor flsMainColor2];
    configure.indicatorColor = [UIColor flsMainColor2];
    configure.indicatorAdditionalWidth = 100;
    
    SGPageTitleView *pageView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, kLQStatusBarHeight, CGRectGetWidth(self.view.frame), kLQNavHeight)
                                                               delegate:self
                                                             titleNames:@[@"关注", @"收藏",  @"历史"]
                                                              configure:configure];
    [self.view addSubview:pageView];
    pageView.selectedIndex = 0;
    _pageTitleView = pageView;
    
    EMFollowListViewCtrl *followViewCtrl = [[EMFollowListViewCtrl alloc] init];
    EMCollectonListViewCtrl *collectonViewCtrl = [[EMCollectonListViewCtrl alloc] init];
    EMHistoryListViewCtrl *historyViewCtrl = [[EMHistoryListViewCtrl alloc] init];
    CGFloat contentViewHeight = CGRectGetHeight(self.view.frame) - CGRectGetMaxY(pageView.frame) - kLQTabarHeight;
    
    SGPageContentView *pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(pageView.frame), CGRectGetWidth(self.view.frame), contentViewHeight)
                                                                         parentVC:self
                                                                         childVCs:@[followViewCtrl, collectonViewCtrl, historyViewCtrl]];
    pageContentView.delegatePageContentView = self;
    [self.view addSubview:pageContentView];
    _pageContentView = pageContentView;
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
