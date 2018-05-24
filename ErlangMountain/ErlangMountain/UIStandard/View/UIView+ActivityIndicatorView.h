//
//  UIView+ActivityIndicatorView.h
//  yueedai
//
//  Created by shiqichao on 15/4/22.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

@interface UIView (ActivityIndicatorView)

@property(nonatomic,strong)MBProgressHUD *activity;

#pragma mark 吐司
//弹出消息
-(void)promptMessage:(NSString *)text;//当前显示
//开始加载提示
- (void)showActivityViewWithTitle:(NSString *)text afterDelay:(NSTimeInterval)delay;
- (void)showActivityViewWithTitle:(NSString *)text;//当前显示
- (void)showActivityViewWithTitle:(NSString *)text enabled:(BOOL)enabled;
- (void)showActivityViewWithTitle:(NSString *)text enabled:(BOOL)enabled afterDelay:(NSTimeInterval)delay;//当前显示
//结束加载提示
- (void)hiddenActivity;
- (void)hiddenActivityWithTitle:(NSString *)text;
- (void)hiddenActivityWithTitle:(NSString *)text afterDelay:(NSTimeInterval)delay;



@end
