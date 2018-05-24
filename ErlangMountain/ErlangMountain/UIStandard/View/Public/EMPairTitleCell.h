//
//  EMPairTitleCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

/**
 双标题格式
 */
@interface EMPairTitleCell : EMTableViewCell
// 50 x 50
@property (nonatomic, strong) UIImageView *realImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;
/** 标题父视图  */
@property (nonatomic, strong) UIView * titleContentView;

+(CGFloat)selfHeight;
@end
