//
//  UIViewController+work.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/2/5.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "UIViewController+work.h"

@implementation UIViewController (work)



+ (UIViewController *)topViewController_ {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

-(void)popToRootViewCtrl
{

}

+(void)popToRootViewCtrl:(Class)class
{
    UIViewController *topViewCtrl = UIViewController.topViewController_;
    if (topViewCtrl.navigationController == nil) { return;  }
    
    if ([topViewCtrl.navigationController.viewControllers.firstObject isKindOfClass:class] && topViewCtrl.navigationController.viewControllers.count > 1) {
        [topViewCtrl.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
