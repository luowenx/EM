//
//  EMChapterTitleCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

/**
 三行标题格式的cell
 */
@interface EMChapterTitleCell : EMTableViewCell
/**
 60x60
 */
@property (nonatomic, strong) UIImageView *realImageView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel1;
@property (nonatomic, strong) UILabel *subTitleLabel2;

+(CGFloat)selfHeight;
@end
