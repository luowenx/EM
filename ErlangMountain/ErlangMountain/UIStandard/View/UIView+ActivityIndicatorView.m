//
//  UIView+ActivityIndicatorView.m
//  yueedai
//
//  Created by shiqichao on 15/4/22.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import "UIView+ActivityIndicatorView.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger,HUDState) {
    HUDStateNone,
    HUDStateLoading,
    HUDStateFinished,
};

@interface MBProgressHUD (CKAfterDelay)

@property(nonatomic,assign)HUDState hUDState;

-(void)ck_show:(BOOL)animated afterDelay:(NSTimeInterval)delay;
-(void)ck_hide:(BOOL)animated;
-(void)ck_hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end


@implementation MBProgressHUD (CKAfterDelay)

- (HUDState) hUDState {\
    HUDState ret = {0};\
    [objc_getAssociatedObject(self, @selector( hUDState )) getValue:&ret];\
    return ret;\
}\
- (void) setHUDState: (HUDState)value{\
    NSValue *valueObj = [NSValue valueWithBytes:&value objCType:@encode(HUDState)];\
    objc_setAssociatedObject(self, @selector( hUDState ), valueObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
}

-(void)ck_show:(BOOL)animated afterDelay:(NSTimeInterval)delay{
    if (delay > 0) {
        [self performSelector:@selector(ck_showDelayed:)
                   withObject:[NSNumber numberWithBool:animated]
                   afterDelay:delay];
    }else{
        [self showAnimated:animated];
    }
}

- (void)ck_showDelayed:(NSNumber *)animated{
    if (self.hUDState == HUDStateFinished) {
        self.hUDState = HUDStateNone;
    }else{
        self.hUDState = HUDStateLoading;
        [self showAnimated:[animated boolValue]];
    }
}

-(void)ck_hide:(BOOL)animated{
    self.hUDState = HUDStateFinished;
    [self hideAnimated:animated];
}

-(void)ck_hide:(BOOL)animated afterDelay:(NSTimeInterval)delay{
    self.hUDState = HUDStateFinished;
    [self hideAnimated:animated afterDelay:delay];
}

@end


@implementation UIView (ActivityIndicatorView)

#pragma mark --提示消息
-(void)promptMessage:(NSString *)text
{
    if (text.length == 0) {
        return;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
//    hud.dimBackground = NO;
    
    [hud hideAnimated:YES afterDelay:1.f];
}

#pragma mark --开始加载提示
- (void)showActivityViewWithTitle:(NSString *)text{
    [self showActivityViewWithTitle:text enabled:YES afterDelay:0];
}

- (void)showActivityViewWithTitle:(NSString *)text afterDelay:(NSTimeInterval)delay{
    [self showActivityViewWithTitle:text enabled:YES afterDelay:delay];
}

- (void)showActivityViewWithTitle:(NSString *)text enabled:(BOOL)enabled{
    [self showActivityViewWithTitle:text enabled:enabled afterDelay:0];
}

- (void)showActivityViewWithTitle:(NSString *)text enabled:(BOOL)enabled afterDelay:(NSTimeInterval)delay{
    [self.activity hideAnimated:YES];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
    hud.backgroundColor = [UIColor clearColor];
    [self addSubview:hud];
    [hud ck_show:YES afterDelay:delay];
    hud.userInteractionEnabled = enabled;
    self.activity=hud;
}

- (void)hiddenActivity{
    [self hiddenActivityWithTitle:nil];
}

//停止加载提示
- (void)hiddenActivityWithTitle:(NSString *)text{
    [self hiddenActivityWithTitle:text afterDelay:1.f];
}

- (void)hiddenActivityWithTitle:(NSString *)text afterDelay:(NSTimeInterval)delay {
    if (text.length > 0) {
        self.activity.mode = MBProgressHUDModeText;
        self.activity.detailsLabel.text = text;
        self.activity.detailsLabel.font = [UIFont systemFontOfSize:15];
        self.activity.backgroundColor = [UIColor clearColor];
        [self.activity ck_hide:YES afterDelay:delay];
    }else{
        [self.activity ck_hide:YES];
    }
    self.activity = nil;
}



#pragma mark -
static char activityKey;
-(void)setActivity:(MBProgressHUD *)activity
{
    if (activity) {
        objc_setAssociatedObject(self, &activityKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, &activityKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
-(MBProgressHUD *)activity
{
    MBProgressHUD *activity = objc_getAssociatedObject(self, &activityKey);
    return activity;
}



@end
