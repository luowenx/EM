//
//  LQAlertController.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  警告框/操作表 集成
 */
@interface LQAlertController : NSObject

#pragma mark - alert

/**
 *  警告框(精简版 只有一个取消按钮时)
 *
 *  @param ctrl    当前控制器
 *  @param message 内容
 *  @param cancel  取消按钮 title
 */
+ (id)alertViewShowWithTarget:(UIViewController *)ctrl
                      message:(NSString *)message
                       cancel:(NSString *)cancel;

/**
 *  警告框(详细版)
 *
 *  @param ctrl    当前控制器
 *  @param title   标题
 *  @param message 内容
 *  @param cancel  取消按钮 title
 *  @param others  其余按钮 title exp: @[@"t1",@"t2",@"t3"]
 *  @param block   点击（除取消按钮以外）按钮回调 aParam==当前点中按钮所在index
 *  @param cancelBlock 取消按钮 回调
 *
 *  ps：block中要弱引用
 */
+ (id)alertViewShowWithTarget:(UIViewController *)ctrl
                        title:(NSString *)title
                      message:(NSString *)message
                       cancel:(NSString *)cancel
                       others:(NSArray *)others
              clickOtherBlock:(void(^)(id aParam))block
             clickCancelBlock:(void(^)(void))cancelBlock;

#pragma mark - sheet

/**
 *  操作表
 *
 *  @param ctrl   当前控制器
 *  @param title  标题
 *  @param cancel 取消按钮 title
 *  @param other  其余按钮 title. exp: @[@"t1",@"t2",@"t3"]
 *  @param block  点击按钮回调 aParam==当前点中按钮所在index
 *
 *  ps：block中要弱引用，取消按钮不会回调
 */
+ (id)sheetShowWithTarget:(UIViewController *)ctrl
                    title:(NSString *)title
                   cancel:(NSString *)cancel
                    other:(NSArray *)other
          clickOtherBlock:(void(^)(id aParam))block;

/**
 *  操作表
 *
 *  @param ctrl      当前控制器
 *  @param title       标题
 *  @param cancel      取消按钮 title
 *  @param other       其余按钮 title. exp: @[@"t1",@"t2",@"t3"]
 *  @param block       点击（除取消按钮以外）按钮回调 aParam==当前点中按钮所在index
 *  @param cancelBlock 取消按钮 回调
 */
+ (id)sheetShowWithTarget:(UIViewController *)ctrl
                    title:(NSString *)title
                   cancel:(NSString *)cancel
                    other:(NSArray *)other
          clickOtherBlock:(void(^)(id aParam))block
         clickCancelBlock:(void(^)(void))cancelBlock;

@end

typedef void(^UIActionSheet_block_self_index)(UIActionSheet *actionSheet, NSInteger btnIndex);
typedef void(^UIActionSheet_block_self)(UIActionSheet *actionSheet);

@interface UIActionSheet (MC) <UIActionSheetDelegate>

- (void)handlerClickedButton:(UIActionSheet_block_self_index)aBlock;
- (void)handlerCancel:(UIActionSheet_block_self)aBlock;
- (void)handlerWillPresent:(UIActionSheet_block_self)aBlock;
- (void)handlerDidPresent:(UIActionSheet_block_self)aBlock;
- (void)handlerWillDismiss:(UIActionSheet_block_self_index)aBlock;
- (void)handlerDidDismiss:(UIActionSheet_block_self_index)aBlock;

@end

typedef void(^UIAlertView_block_self_index)(UIAlertView *alertView, NSInteger btnIndex);
typedef void(^UIAlertView_block_self)(UIAlertView *alertView);
typedef BOOL(^UIAlertView_block_shouldEnableFirstOtherButton)(UIAlertView *alertView);

@interface UIAlertView (MC)


- (void)handlerClickedButton:(UIAlertView_block_self_index)aBlock;
- (void)handlerCancel:(UIAlertView_block_self)aBlock;
- (void)handlerWillPresent:(UIAlertView_block_self)aBlock;
- (void)handlerDidPresent:(UIAlertView_block_self)aBlock;
- (void)handlerWillDismiss:(UIAlertView_block_self_index)aBlock;
- (void)handlerDidDismiss:(UIAlertView_block_self_index)aBlock;
- (void)handlerShouldEnableFirstOtherButton:(UIAlertView_block_shouldEnableFirstOtherButton)aBlock;

// 延时消失
- (void)showWithDuration:(NSTimeInterval)i;

@end


