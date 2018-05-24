//
//  MCAutoScrollView.h
//  MCStandard
//
//  Created by xtkj on 16/9/12.
//  Copyright © 2016年 michong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSImageCell.h"

/**
 *  滚动视图
 */
@protocol AutoScrollDelegate <NSObject> //滚动视图协议
@required
/**
 *  @param cell 内部cell
 *  @param data 图片数据对象
 */
- (void)autoScrollLoadImageCell:(MCSImageCell *)cell cellData:(id)data;


@optional
/**
 *  @param itemInfo  选中的数据对象
 */
- (void)autoScrollDidSelectItemWithData:(id)itemInfo;

@end

@interface MCSAutoScrollView : UIView

//高度约束，当需要调整该视图高度时使用。
//ps：使用该变量，需在创建视图时将高度约束赋值给该变量
@property (nonatomic,strong) NSLayoutConstraint *kMCSheightCons;

@property (nonatomic, weak) id<AutoScrollDelegate>  delegate;

//分页控件
@property (nonatomic, strong ) UIPageControl    *pageControl;

//关闭按钮,默认是隐藏。
@property (nonatomic, strong ) UIButton   *closeBtn;

//刷新界面,赋值数据源
- (void)reloadScrollData:(NSArray*)dataArray;

//刷新滚动视图
- (void)resetContOffset;

//定时器开始
- (void)timerStart;

//定时器释放.必须外部调用，否则视图无法释放
- (void)timerfree;

@end
