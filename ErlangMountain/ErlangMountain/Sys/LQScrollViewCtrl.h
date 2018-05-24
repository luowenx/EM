//
//  LQScrollViewCtrl.h
//
//  Created by lequwuxian1 on 2018/2/6.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQBaseViewCtrl.h"

/**
 可滚动
 */
@interface LQScrollViewCtrl : LQBaseViewCtrl

//背景滚动视图
@property (nonatomic, strong, readonly) UIScrollView *bgView;

/**
 *  一个添加到bgView上的显示视图，类似于cell.contentView
 *  添加子视图，添加到该视图上，而不是添加到bgView上
 *  frame设置：需要设置translatesAutoresizingMaskIntoConstraints为YES，并且设置frame,并且设置bgView的contentSize
 
 *  autolayout设置：默认 子视图需要设置上下边距和高 以确定该contentView的高,
 /-- eg:
 autoPinEdgeToSuperviewEdge:ALEdgeTop offset:*
 autoPinEdgeToSuperviewEdge:ALEdgeBottom *
 autoSetDimension:ALDimensionHeight toSize:*
 /
 ⭐️ 禁止设置subView对于bgView的约束
 */
@property (nonatomic, strong, readonly) UIView *contentView;


@end
