//
//  LQAlertController.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/1/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "LQAlertController.h"
#import <objc/runtime.h>
#import "NSArray+MC.h"

@implementation LQAlertController

#pragma mark - alert

+ (id)alertViewShowWithTarget:(UIViewController *)ctrl
                      message:(NSString *)message
                       cancel:(NSString *)cancel
{
    return [self alertViewShowWithTarget:ctrl
                                   title:nil
                                 message:message
                                  cancel:cancel
                                  others:nil
                         clickOtherBlock:nil
                        clickCancelBlock:nil];
}

+ (id)alertViewShowWithTarget:(UIViewController *)ctrl
                        title:(NSString *)title
                      message:(NSString *)message
                       cancel:(NSString *)cancel
                       others:(NSArray *)others
              clickOtherBlock:(void(^)(id aParam))block
             clickCancelBlock:(void (^)(void))cancelBlock
{
    Class vClass = NSClassFromString(@"UIAlertController");
    if(vClass) {
        UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:title
                                                                           message:message
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        if (cancel.length > 0) {
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction *action) {
                                                                     if (cancelBlock) cancelBlock();
                                                                 }];
            [alertCtr addAction:cancelAction];
        }
        
        for (NSInteger index = 0 ;index < others.count ; index++) {
            
            NSString *aActionTitle = [others objectAtIndex:index];
            
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:aActionTitle
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
                                                                    if (block) block(@(index));
                                                                }];
            [alertCtr addAction:otherAction];
        }
        
        [ctrl presentViewController:alertCtr animated:YES completion:nil];
        return alertCtr;
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:cancel
                                              otherButtonTitles:
                              [others safeObjectAtIndex:0],[others safeObjectAtIndex:1],
                              [others safeObjectAtIndex:2],[others safeObjectAtIndex:3],
                              [others safeObjectAtIndex:4],[others safeObjectAtIndex:5],
                              [others safeObjectAtIndex:6],[others safeObjectAtIndex:7],
                              [others safeObjectAtIndex:8],[others safeObjectAtIndex:9],nil];
        
        [alert handlerClickedButton:^(UIAlertView *alertView, NSInteger btnIndex) {
            
            if (btnIndex == alertView.cancelButtonIndex) {
                if (cancelBlock) cancelBlock();
            } else {
                if (block) block(@(btnIndex - alertView.firstOtherButtonIndex));
            }
        }];
        
        [alert show];
        return alert;
    }
    return nil;
}

#pragma mark - sheet
+ (id)sheetShowWithTarget:(UIViewController *)ctrl
                    title:(NSString *)title
                   cancel:(NSString *)cancel
                    other:(NSArray *)other
          clickOtherBlock:(void(^)(id aParam))block
{
    return [self sheetShowWithTarget:ctrl
                               title:title
                              cancel:cancel
                               other:other
                     clickOtherBlock:block
                    clickCancelBlock:nil];
}

+ (id)sheetShowWithTarget:(UIViewController *)ctrl
                    title:(NSString *)title
                   cancel:(NSString *)cancel
                    other:(NSArray *)other
          clickOtherBlock:(void(^)(id aParam))block
         clickCancelBlock:(void (^)(void))cancelBlock
{
    Class vClass = NSClassFromString(@"UIAlertController");
    
    if(vClass) {
        
        UIAlertController * alertCtr = [UIAlertController alertControllerWithTitle:title
                                                                           message:nil
                                                                    preferredStyle:UIAlertControllerStyleActionSheet];
        
        for (NSInteger index = 0 ;index < other.count ; index ++) {
            
            NSString *aActionTitle = [other objectAtIndex:index];
            
            UIAlertAction *sheetAction = [UIAlertAction actionWithTitle:aActionTitle
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
                                                                    if (block) block(@(index));
                                                                }];
            [alertCtr addAction:sheetAction];
        }
        
        if ([cancel length] > 0) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction *action) {
                                                                     if (cancelBlock) cancelBlock();
                                                                 }];
            [alertCtr addAction:cancelAction];
        }
        
        [ctrl presentViewController:alertCtr animated:YES completion:nil];
        return alertCtr;
    } else {
        
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:title
                                                           delegate:nil
                                                  cancelButtonTitle:cancel
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:
                                [other safeObjectAtIndex:0],[other safeObjectAtIndex:1],
                                [other safeObjectAtIndex:2],[other safeObjectAtIndex:3],
                                [other safeObjectAtIndex:4],[other safeObjectAtIndex:5],
                                [other safeObjectAtIndex:6],[other safeObjectAtIndex:7],
                                [other safeObjectAtIndex:8],[other safeObjectAtIndex:9],nil];
        
        [sheet handlerClickedButton:^(UIActionSheet *actionSheet, NSInteger btnIndex) {
            if (btnIndex == actionSheet.cancelButtonIndex) {
                if (cancelBlock) cancelBlock();
            } else {
                if (block) block(@(btnIndex));
            }
        }];
        
        [sheet showInView:ctrl.view.window];
        return sheet;
    }
    return nil;
}

@end


#undef    UIActionSheet_key_clicked
#define UIActionSheet_key_clicked    "UIActionSheet.clicked"
#undef    UIActionSheet_key_cancel
#define UIActionSheet_key_cancel    "UIActionSheet.cancel"
#undef    UIActionSheet_key_willPresent
#define UIActionSheet_key_willPresent    "UIActionSheet.willPresent"
#undef    UIActionSheet_key_didPresent
#define UIActionSheet_key_didPresent    "UIActionSheet.didPresent"
#undef    UIActionSheet_key_willDismiss
#define UIActionSheet_key_willDismiss    "UIActionSheet.willDismiss"
#undef    UIActionSheet_key_didDismiss
#define UIActionSheet_key_didDismiss    "UIActionSheet.sidDismiss"

@implementation UIActionSheet (MC)
- (void)handlerClickedButton:(UIActionSheet_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_clicked, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerCancel:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_cancel, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerWillPresent:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_willPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerDidPresent:(UIActionSheet_block_self)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_didPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerWillDismiss:(UIActionSheet_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_willDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerDidDismiss:(UIActionSheet_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIActionSheet_key_didDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = objc_getAssociatedObject(self, UIActionSheet_key_clicked);
    
    if (block)
        block(actionSheet, buttonIndex);
}
-(void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = objc_getAssociatedObject(self, UIActionSheet_key_cancel);
    
    if (block)
        block(actionSheet);
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = objc_getAssociatedObject(self, UIActionSheet_key_willPresent);
    
    if (block)
        block(actionSheet);
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    UIActionSheet_block_self block = objc_getAssociatedObject(self, UIActionSheet_key_didPresent);
    
    if (block)
        block(actionSheet);
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = objc_getAssociatedObject(self, UIActionSheet_key_willDismiss);
    
    if (block)
        block(actionSheet, buttonIndex);
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIActionSheet_block_self_index block = objc_getAssociatedObject(self, UIActionSheet_key_didDismiss);
    
    if (block)
        block(actionSheet, buttonIndex);
}

@end



#undef    UIAlertView_key_clicked
#define UIAlertView_key_clicked    "UIAlertView.clicked"
#undef    UIAlertView_key_cancel
#define UIAlertView_key_cancel    "UIAlertView.cancel"
#undef    UIAlertView_key_willPresent
#define UIAlertView_key_willPresent    "UIAlertView.willPresent"
#undef    UIAlertView_key_didPresent
#define UIAlertView_key_didPresent    "UIAlertView.didPresent"
#undef    UIAlertView_key_willDismiss
#define UIAlertView_key_willDismiss    "UIAlertView.willDismiss"
#undef    UIAlertView_key_didDismiss
#define UIAlertView_key_didDismiss    "UIAlertView.didDismiss"
#undef    UIAlertView_key_shouldEnableFirstOtherButton
#define UIAlertView_key_shouldEnableFirstOtherButton    "UIAlertView.SEFOB"

@implementation UIAlertView (MC)

- (void)handlerClickedButton:(UIAlertView_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_clicked, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerCancel:(void (^)(UIAlertView *alertView))aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_cancel, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerWillPresent:(void (^)(UIAlertView *alertView))aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_willPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)handlerDidPresent:(void (^)(UIAlertView *alertView))aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_didPresent, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerWillDismiss:(UIAlertView_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_willDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerDidDismiss:(UIAlertView_block_self_index)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_didDismiss, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)handlerShouldEnableFirstOtherButton:(UIAlertView_block_shouldEnableFirstOtherButton)aBlock
{
    self.delegate = self;
    objc_setAssociatedObject(self, UIAlertView_key_shouldEnableFirstOtherButton, aBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_clicked);
    
    if (block)
        block(alertView, buttonIndex);
}
- (void)alertViewCancel:(UIAlertView *)alertView
{
    UIAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_cancel);
    
    if (block)
        block(alertView);
}
- (void)willPresentAlertView:(UIAlertView *)alertView{
    UIAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_willPresent);
    
    if (block)
        block(alertView);
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    UIAlertView_block_self block = objc_getAssociatedObject(self, UIAlertView_key_didPresent);
    
    if (block)
        block(alertView);
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_willDismiss);
    
    if (block)
        block(alertView,buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIAlertView_block_self_index block = objc_getAssociatedObject(self, UIAlertView_key_didDismiss);
    
    if (block)
        block(alertView, buttonIndex);
}


- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    UIAlertView_block_shouldEnableFirstOtherButton block = objc_getAssociatedObject(self, UIAlertView_key_shouldEnableFirstOtherButton);
    
    if (block)
        return block(alertView);
    
    return YES;
}

- (void)showWithDuration:(NSTimeInterval)i
{
    [NSTimer scheduledTimerWithTimeInterval:i
                                     target:self
                                   selector:@selector(xyDismiss)
                                   userInfo:self
                                    repeats:NO];
    [self show];
}

- (void)xyDismiss
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

@end
