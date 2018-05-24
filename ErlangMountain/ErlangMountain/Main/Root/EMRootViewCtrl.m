//
//  EMRootViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRootViewCtrl.h"
#import "EMNavigationCtrl.h"
#import "EMPlayViewCtrl.h"

#import "EMTabarCenterItem.h"
#import "EMPlayViewModel.h"

#import "EMSetViewCtrl.h"
#import "EMFindViewCtrl.h"
#import "EMSearchViewCtrl.h"
#import "EMCollectionViewCtrl.h"

@interface EMRootViewCtrl ()
@property (nonatomic, strong) EMSetViewCtrl * setViewCtrl;
@property (nonatomic, strong) EMFindViewCtrl * findViewCtrl;
@property (nonatomic, strong) EMSearchViewCtrl * searchViewCtrl;
@property (nonatomic, strong) EMCollectionViewCtrl * collectionViewCtrl;
@end

@implementation EMRootViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    EMNavigationCtrl *setNavCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:self.setViewCtrl];
    EMNavigationCtrl *findNavCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:self.findViewCtrl];
    EMNavigationCtrl *searchNavCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:self.searchViewCtrl];
    EMNavigationCtrl *collectionNavCtrl = [[EMNavigationCtrl alloc] initWithRootViewController:self.collectionViewCtrl];
    
    LQBaseViewCtrl *placeholderViewCtrl = [[LQBaseViewCtrl alloc] init];

    self.viewControllers = @[findNavCtrl, searchNavCtrl, placeholderViewCtrl, collectionNavCtrl, setNavCtrl];
    
    EMTabarCenterItem *centerView = [EMTabarCenterItem newAutoLayoutView];
    [self.tabBar addSubview:centerView];
    [centerView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [centerView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    
    @weakify(centerView, self)
    centerView.action = ^{
        [EMPlayViewCtrl presentPlayViewCtrlInTarget:(id)self_weak_ playInfo:nil];
    };
    
    [RACObserve([EMPlayViewModel shareInstance], playItemInfo) subscribeNext:^(EMPlayItemInfo *x) {
        [centerView_weak_ setImageWithName:nil url:x.coverSmall];
    }];
    
    [RACObserve([EMPlayViewModel shareInstance], isPlaying) subscribeNext:^(id x) {
        if ([x boolValue]) {
            [centerView_weak_ start];
        }else {
            [centerView_weak_ stop];
        }
    }];
    
    
    
}

-(EMFindViewCtrl *)findViewCtrl
{
    if (!_findViewCtrl) {
        _findViewCtrl = [[EMFindViewCtrl alloc] init];
        _findViewCtrl.tabBarItem.title = @"发现";
        _findViewCtrl.tabBarItem.image = imageWithName(@"icon_home_n");
        _findViewCtrl.tabBarItem.selectedImage = [imageWithName(@"icon_home_h") imageWithRenderingMode:YES];
        [_findViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor flsMainColor]} forState:UIControlStateSelected];
        [_findViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xa1a1a1)} forState:UIControlStateNormal];
    }
    return _findViewCtrl;
}

-(EMSearchViewCtrl *)searchViewCtrl
{
    if (!_searchViewCtrl) {
        _searchViewCtrl = [[EMSearchViewCtrl alloc] init];
        _searchViewCtrl.tabBarItem.title = @"搜索";
        _searchViewCtrl.tabBarItem.image = imageWithName(@"icon_search_n");
        _searchViewCtrl.tabBarItem.selectedImage = [imageWithName(@"icon_search_h") imageWithRenderingMode:YES];
        [_searchViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor flsMainColor]} forState:UIControlStateSelected];
        [_searchViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xa1a1a1)} forState:UIControlStateNormal];
    }
    return _searchViewCtrl;
}

-(EMCollectionViewCtrl *)collectionViewCtrl
{
    if (!_collectionViewCtrl) {
        _collectionViewCtrl = [[EMCollectionViewCtrl alloc] init];
        _collectionViewCtrl.tabBarItem.title = @"收藏";
        _collectionViewCtrl.tabBarItem.image = imageWithName(@"iconfont-like");
        _collectionViewCtrl.tabBarItem.selectedImage = [imageWithName(@"iconfont-like-selected") imageWithRenderingMode:YES];
        [_collectionViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor flsMainColor]} forState:UIControlStateSelected];
        [_collectionViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xa1a1a1)} forState:UIControlStateNormal];
    }
    return _collectionViewCtrl;
}

-(EMSetViewCtrl *)setViewCtrl
{
    if (!_setViewCtrl) {
        _setViewCtrl = [[EMSetViewCtrl alloc] init];
        _setViewCtrl.tabBarItem.title = @"设置";
        _setViewCtrl.tabBarItem.image = imageWithName(@"icon_setting_n");
        _setViewCtrl.tabBarItem.selectedImage = [imageWithName(@"icon_setting_h") imageWithRenderingMode:YES];
        [_setViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor flsMainColor]} forState:UIControlStateSelected];
        [_setViewCtrl.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xa1a1a1)} forState:UIControlStateNormal];
    }
    return _setViewCtrl;
}

@end
