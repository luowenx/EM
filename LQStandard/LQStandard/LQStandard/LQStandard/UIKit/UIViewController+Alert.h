//
//  UIViewController+Alert.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

//显示操作表，block中要弱引用, 取消不回调。不需要调[sheet showInView:XX]方法
//block : Index
- (id)sheetShowWithTitle:(NSString *)title cancel:(NSString *)cancel other:(NSArray *)other clickedBlock:(void (^)(id index))block cancel:(void (^)(void))cancelBlock;
- (id)sheetShowWithTitle:(NSString *)title cancel:(NSString *)cancel other:(NSArray *)other clickedBlock:(void (^)(id index))block;

//显示警告框，block中要弱引用, 取消不回调。不需要调[alert show]方法
- (id)alertViewShowWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel other:(NSString *)other clickedBlock:(void (^)(BOOL isTrue))block;
- (id)alertViewShowWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel other:(NSString *)other clickedBlock:(void (^)(BOOL isTrue))block isForce:(BOOL)force;
- (id)alertViewShowWithMessage:(NSString *)message cancel:(NSString *)cancel;

@end
