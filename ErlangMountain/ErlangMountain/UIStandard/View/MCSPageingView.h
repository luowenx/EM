//
//  MCSPageingView.h
//  haochang
//
//  Created by luowenx on 16/9/12.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MCSPageingView;
static CGFloat kMCSPageingViewSizeHeight = 40.f;

@protocol MCSPageingViewSelectDelegate <NSObject>

@optional
/**
 *  选中某个下标回调
 *
 *  @param pageingView self
 *  @param index       下标
 *
 *  @return 是否允许此次切换成功
 */
- (BOOL)didSelectPage:(MCSPageingView*)pageingView index:(NSUInteger)index;
@end

/**
 *  选中某个下标回调
 *
 *  @param pageingView self
 *  @param index       下标
 *
 *  @return 是否允许此次切换成功
 */
typedef BOOL (^MCSPageingSelectBlock)(MCSPageingView* pageingView, NSUInteger index);

/**
 *  UI标准分页界面 (自动布局实现,高度已设置,使用时设定上左右约束即可)
 */

@interface MCSPageingView : UIView

/**
 *  是否允许动画切换 （默认开启）
 */
@property (nonatomic, assign) BOOL animationAllow;
/**
 *  标题数组
 */
@property (nonatomic, strong, readonly) NSArray<NSString*>* titles;

/**
 *  当前选中下标
 */
@property (nonatomic, assign, readonly) NSUInteger currentIndex;
/**
 *  点击事件回调 int 标题下标
 */
@property (nonatomic, copy) MCSPageingSelectBlock selectBlock;

/**
 *  点击事件代理
 */
@property (nonatomic, weak) id<MCSPageingViewSelectDelegate> delegate;

/**
 *  初始化标题和回调
 *
 *  @param titles 标题数组
 *  @param block  回调
 *
 *  @return self
 */
- (instancetype)initWithTitles:(NSArray<NSString*>*)titles selectBlock:(MCSPageingSelectBlock)block;

/**
 *  初始化标题和回调
 *
 *  @param titles   标题数组
 *  @param delegate 回调
 *
 *  @return self
 */
- (instancetype)initWithTitles:(NSArray<NSString*>*)titles selectDelegate:(id<MCSPageingViewSelectDelegate>)delegate;

/**
 *  设置选中index
 *
 *  @param index 下标
 */
- (void)selectIndex:(NSUInteger)index;

/**
 *  重置标题(数量)
 *
 *  @param index 下标
 *  @param title 标题
 */
- (void)resetTitle:(NSUInteger)index title:(NSString*)title;

/**
 *  获取你想操作的那个item
 *
 *  @param index 下标
 *
 */
- (UIButton *)itemAtIdex:(NSUInteger)index;

@end
