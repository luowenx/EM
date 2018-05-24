//
//  LQBaseViewCtrl.h
//
//  Created by lequwuxian1 on 2017/12/8.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMViewModel.h"

typedef NS_ENUM(NSInteger, LQNavigationBarType) {
    LQNavigationBarTypeBlack,
    LQNavigationBarTypeRed,
    LQNavigationBarTypeWhite
};
/**
 控制器基类
 */
@interface LQBaseViewCtrl : UIViewController

@property (nonatomic, readonly) BOOL viewAppear;

/** 导航栏样式 */
@property (nonatomic) LQNavigationBarType navigationBarStyle;

/**是否隐藏导航栏 */
@property (nonatomic) BOOL navigationBarHidden;

// ------- over write --------//

// 视图初始化
- (void)initUI;
// 数据逻辑初始化
- (void)initViewModel;


@end


/**
 导航栏相关api
 */
@interface LQBaseViewCtrl(Navigation)

/**
 设置导航栏左边按钮

 @param leftTitle 左边按钮文本
 @param hander 事件
 @return 此按钮
 */
-(UIButton *)addLeftNavWithTitle:(NSString *)leftTitle
                          hander:(void(^)(void))hander;

//@param leftImage 左边按钮图片名字
-(UIButton *)addLeftNavWithImageName:(NSString *)leftImage
                              hander:(void(^)(void))hander;


/**
 设置导航栏右边按钮

 @param rightTitle 右边按钮文本
 @param hander 事件
 @return 按钮
 */
-(UIButton *)addRightNavWithTitle:(NSString *)rightTitle hander:(void(^)(void))hander;
//@param rightImage 右边按钮图片名
-(UIButton *)addRightNavWithImageName:(NSString *)rightImage hander:(void(^)(void))hander;

-(void)onBack;

@end


@interface LQBaseViewCtrl(Tips)

/**
 显示占位视图

 @param superView 父视图
 @param imageName 图片名字
 @param title 文字描述
 @return 该视图
 */
-(UIView *)showEmptyViewInView:(UIView *)superView imageName:(NSString *)imageName title:(NSString *)title;
-(UIView *)showEmptyViewInView:(UIView *)superView imageName:(NSString *)imageName;
-(UIView *)showEmptyViewImageName:(NSString *)imageName title:(NSString *)title;
-(UIView *)showEmptyViewInView:(UIView *)superView;
-(UIView *)showEmptyView;

/** 隐藏  */
- (void)hiddenEmptyView;

/**
 *  子类重写
 *  刷新数据
 */
- (void)reloadEmptyView __attribute__ ((objc_requires_super));

@end
