//
//  UIView+LQ.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/11.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LQ)

//设置边框
- (void)setCornerRadius:(CGFloat)radius
            borderColor:(UIColor *)borderColor
            borderWidth:(CGFloat)borderWidth;
- (instancetype)borderWidth:(CGFloat)width color:(UIColor *)color;

// 圆形
- (instancetype)rounded;
// 圆角矩形, corners:一个矩形的四个角。
- (instancetype)roundedRectWith:(CGFloat)radius;
- (instancetype)roundedRectWith:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;
- (instancetype)roundedRectWith:(CGFloat)radius bounds:(CGRect)bounds byRoundingCorners:(UIRectCorner)corners;

// 增加手势
- (void)addTapGestureWithTarget:(id)target action:(SEL)action;
- (void)addTapGestureWithBlock:(void (^)(UIView *gestureView))aBlock;
- (void)removeTapGesture;
- (void)addTapWithGestureBlock:(void (^)(UITapGestureRecognizer *gesture))aBlock;
- (void)addTapWithDelegate:(id<UIGestureRecognizerDelegate>)delegate gestureBlock:(void (^)(UITapGestureRecognizer *gesture))aBlock;


@end
