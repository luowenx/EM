//
//  EMSectionView.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 列表的 Section
 */
@interface EMSectionView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

/**
 使用默认高度初始化
 @param title 文本
 @return Section
 */
+(instancetype)sectionWithTitle:(NSString *)title;

/**
 默认高度
 @return float
 */
+(CGFloat)defaultHeight;

@end
