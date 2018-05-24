//
//  EMTabarCenterItem.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/16.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 tabar 下面中心按钮
 */
@interface EMTabarCenterItem : UIView

/**
 点击响应
 */
@property (nonatomic, copy) void  (^action)(void);

/**
 设置旋转图片
 @param name 本地
 @param urlString 网络图片
 */
-(void)setImageWithName:(NSString *)name url:(NSString *)urlString;

// or go on
-(void)start;
// 停止, 将会清除图片
-(void)stop;
// 暂停
-(void)pause;

@end
