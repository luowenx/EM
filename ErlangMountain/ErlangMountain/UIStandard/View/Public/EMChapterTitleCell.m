//
//  EMChapterTitleCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMChapterTitleCell.h"

@implementation EMChapterTitleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _realImageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_realImageView];
        [_realImageView autoSetDimensionsToSize:CGSizeMake(60 , 60)];
        [_realImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_realImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        
        UIView *contentView = [UIView newAutoLayoutView];
        [self.contentView addSubview:contentView];
        [contentView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_realImageView withOffset:kEMSPaddingNormal];
        [contentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [contentView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont emFontNormal];
        [contentView addSubview:_titleLabel];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal relation:(NSLayoutRelationGreaterThanOrEqual)];
        
        _subTitleLabel1 = [UILabel newAutoLayoutView];
        _subTitleLabel1.text = @"";
        _subTitleLabel1.font = [UIFont emFontSmaller];
        _subTitleLabel1.textColor = [UIColor flsCancelColor];
        [contentView addSubview:_subTitleLabel1];
        [_subTitleLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_subTitleLabel1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal relation:NSLayoutRelationGreaterThanOrEqual];
        [_subTitleLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:kEMSPaddingSmall];
        
        _subTitleLabel2 = [UILabel newAutoLayoutView];
        _subTitleLabel2.font = [UIFont emFontSmaller];
        _subTitleLabel2.textColor = [UIColor flsCancelColor];
        _subTitleLabel2.text = @"";
        [contentView addSubview:_subTitleLabel2];
        [_subTitleLabel2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_subTitleLabel2 autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [_subTitleLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_subTitleLabel1 withOffset:kEMSPaddingSmall];
    }
    return self;
}

+(CGFloat)selfHeight
{
    return 0;
}

@end
