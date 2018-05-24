//
//  LQScrollViewCtrl.m
//
//  Created by lequwuxian1 on 2018/2/6.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQScrollViewCtrl.h"

@interface LQScrollViewCtrl ()

@end

@implementation LQScrollViewCtrl

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bgView = [UIScrollView newAutoLayoutView];
    //    [_bgView setDelaysContentTouches:NO];
    [_bgView setBackgroundColor:[UIColor whiteColor]];
    [_bgView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_bgView];
    
    _contentView = [UIView newAutoLayoutView];
    _contentView.backgroundColor = [UIColor whiteColor];
    [_bgView addSubview:_contentView];
    
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_bgView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_bgView.superview];
    [_bgView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_bgView.superview];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_contentView(width)]|" options:0 metrics:@{@"width":@(self.view.frame.size.width)} views:NSDictionaryOfVariableBindings(_contentView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_contentView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
    [_bgView setNeedsLayout];
    [_bgView layoutIfNeeded];
}

@end
