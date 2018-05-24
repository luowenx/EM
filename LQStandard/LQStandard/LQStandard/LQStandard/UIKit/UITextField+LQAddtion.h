//
//  UITextField+LQAddtion.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/13.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LQAddtion)

/**
 限制文本输出
 @param number 最大输入字数
 @param autoIntercept 是否自动截取
 @param whitespace 是否计算首尾空格
 */
- (NSInteger)inputConstraints:(NSInteger)number
                autoIntercept:(BOOL)autoIntercept
                   whitespace:(BOOL)whitespace;

@end
