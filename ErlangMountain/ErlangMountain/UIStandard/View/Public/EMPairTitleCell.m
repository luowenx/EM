//
//  EMPairTitleCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPairTitleCell.h"

@implementation EMPairTitleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _realImageView = [UIImageView newAutoLayoutView];
        [_realImageView roundedRectWith:25];
        [self.contentView addSubview:_realImageView];
        [_realImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_realImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kEMSPaddingNormal];
        [_realImageView autoSetDimensionsToSize:CGSizeMake(50, 50)];
        
        _titleContentView = [UIView newAutoLayoutView];
        [self.contentView addSubview:_titleContentView];
        [_titleContentView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_titleContentView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_realImageView withOffset:kEMSPaddingNormal];
        [_titleContentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal relation:(NSLayoutRelationGreaterThanOrEqual)];
        
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = [UIFont emFontLarge];
        [self.titleContentView addSubview:_titleLabel];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        _subTitleLabel = [UILabel newAutoLayoutView];
        _subTitleLabel.font = [UIFont emFontSmall];
        _subTitleLabel.textColor = [UIColor flsCancelColor];
        [self.titleContentView addSubview:_subTitleLabel];
        [_subTitleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [_subTitleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_subTitleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_subTitleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:kEMSPaddingSmall];
    }
    return self;
}

+(CGFloat)selfHeight
{
    return 0;
}

@end
