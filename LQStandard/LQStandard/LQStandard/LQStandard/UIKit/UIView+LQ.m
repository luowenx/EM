//
//  UIView+LQ.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/11.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "UIView+LQ.h"
#import <objc/runtime.h>

#define UIView_key_tapBlock       "UIView.tapBlock"
#define UITapGesture_key_tapBlock   @"UITapGesture_key_tapBlock"

@implementation UIView (LQ)

+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method method2 = class_getInstanceMethod([self class], @selector(afterInitWithFrame:));
    method_exchangeImplementations(method1, method2);
}

- (instancetype)afterInitWithFrame:(CGRect)frame
{
    id createdInstance = [self afterInitWithFrame:frame];
    self.exclusiveTouch = YES;
    return createdInstance;
}

- (instancetype)rounded
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width / 2;
    
    return self;
}

- (void)setCornerRadius:(CGFloat)radius
            borderColor:(UIColor *)borderColor
            borderWidth:(CGFloat)borderWidth
{
    [[self layer] setMasksToBounds:YES];
    [[self layer] setCornerRadius:radius];
    [[self layer] setBorderColor:[borderColor CGColor]];
    [[self layer] setBorderWidth:borderWidth];
}

- (instancetype)borderWidth:(CGFloat)width color:(UIColor *)color
{
    self.layer.borderWidth = width;
    if (color)
    {
        self.layer.borderColor = color.CGColor;
    }
    
    return self;
}


- (instancetype)roundedRectWith:(CGFloat)radius{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = radius;
    return self;
}

- (instancetype)roundedRectWith:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners
{
    return [self roundedRectWith:radius bounds:self.bounds byRoundingCorners:corners];
}

- (instancetype)roundedRectWith:(CGFloat)radius bounds:(CGRect)bounds byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;

    return self;
}

#pragma mark new--

- (void)addTapGestureWithTarget:(id)target action:(SEL)action
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}
- (void)removeTapGesture
{
    for (UIGestureRecognizer *gesture in self.gestureRecognizers)
    {
        if ([gesture isKindOfClass:[UITapGestureRecognizer class]])
        {
            [self removeGestureRecognizer:gesture];
        }
    }
}

- (void)addTapGestureWithBlock:(void (^)(UIView *gestureView))aBlock;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap)];
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self, UIView_key_tapBlock, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)actionTap
{
    void (^block)(UIView *)  = objc_getAssociatedObject(self, UIView_key_tapBlock);
    
    if (block)
    {
        block(self);
    }
}

- (void)addTapWithGestureBlock:(void (^)(UITapGestureRecognizer *gesture))aBlock
{
    [self addTapWithDelegate:nil gestureBlock:aBlock];
}

- (void)addTapWithDelegate:(id<UIGestureRecognizerDelegate>)delegate gestureBlock:(void (^)(UITapGestureRecognizer *))aBlock {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTap:)];
    tap.delegate = delegate;
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, UITapGesture_key_tapBlock, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)actionTap:(UITapGestureRecognizer *)aGesture
{
    __weak UITapGestureRecognizer *weakGesture = aGesture;
    void (^block)(UITapGestureRecognizer *)  = objc_getAssociatedObject(self, UITapGesture_key_tapBlock);
    
    if (block)
    {
        block(weakGesture);
    }
}


@end
