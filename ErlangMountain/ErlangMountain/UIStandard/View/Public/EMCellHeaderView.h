//
//  EMCellHeaderView.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 cell头部的视图
 */
@interface EMCellHeaderView : UIView

@property (nonatomic, strong, readonly) UIImageView * headerImageView;

@property (nonatomic, strong, readonly) UILabel * headerTitleLabel;

@property (nonatomic, strong, readonly) UILabel * tailTitleLabel;

@property (nonatomic, strong, readonly) UIImageView * tailImageView;

@property (nonatomic, copy) void (^headerAction)(void);


+(CGFloat)defaultHeight;

@end
