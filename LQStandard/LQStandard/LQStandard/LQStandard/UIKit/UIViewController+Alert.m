//
//  UIViewController+Alert.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "UIViewController+Alert.h"
#import "LQAlertController.h"

@implementation UIViewController (Alert)


//显示操作表，block中要弱引用, 取消不回调。不需要调[sheet showInView:XX]方法
- (id)sheetShowWithTitle:(NSString*)title cancel:(NSString*)cancel other:(NSArray*)other clickedBlock:(void (^)(id index))block {
    return [self sheetShowWithTitle:title cancel:cancel other:other clickedBlock:block cancel:nil];
}

- (id)sheetShowWithTitle:(NSString*)title cancel:(NSString*)cancel other:(NSArray*)other clickedBlock:(void (^)(id index))block cancel:(void (^)(void))cancelBlock {
    return [LQAlertController sheetShowWithTarget:self
                                            title:title
                                           cancel:cancel
                                            other:other
                                  clickOtherBlock:block
                                 clickCancelBlock:cancelBlock];
}

- (id)alertViewShowWithMessage:(NSString*)message cancel:(NSString*)cancel {
    return [self alertViewShowWithTitle:nil
                                message:message
                                 cancel:cancel
                                  other:nil
                           clickedBlock:nil];
}

- (id)alertViewShowWithTitle:(NSString*)title
                     message:(NSString*)message
                      cancel:(NSString*)cancel
                       other:(NSString*)other
                clickedBlock:(void (^)(BOOL isTrue))block {
    return [self alertViewShowWithTitle:title
                                message:message
                                 cancel:cancel
                                  other:other
                           clickedBlock:block
                                isForce:YES];
}

//显示警告框，block中要弱引用, 取消不回调。不需要调[alert show]方法
- (id)alertViewShowWithTitle:(NSString*)title
                     message:(NSString*)message
                      cancel:(NSString*)cancel
                       other:(NSString*)other
                clickedBlock:(void (^)(BOOL isTrue))block
                     isForce:(BOOL)force {
    if (!force) {
        return nil;
    }
    
    return [LQAlertController alertViewShowWithTarget:self
                                                title:title
                                              message:message
                                               cancel:cancel
                                               others:other.length > 0 ? @[ other ] : nil
                                      clickOtherBlock:^(id index) {
                                          if (block)
                                              block(YES);
                                      }
                                     clickCancelBlock:^{
                                         if (block)
                                             block(NO);
                                     }];
}

@end
