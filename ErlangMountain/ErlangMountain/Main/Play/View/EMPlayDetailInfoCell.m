//
//  EMPlayDetailInfoCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayDetailInfoCell.h"

@implementation EMPlayDetailInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _aImageView = [UIImageView newAutoLayoutView];
        [_aImageView roundedRectWith:40];
        [self.contentView addSubview:_aImageView];
        [_aImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kEMSPaddingLarge];
        [_aImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingLarge];
        [_aImageView autoSetDimensionsToSize:CGSizeMake(80, 80)];
        
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.font = [UIFont emFontLarge];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_aImageView];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_aImageView withOffset:kEMSPaddingNormal];
        
        _authImageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_authImageView];
        [_authImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_titleLabel withOffset:kEMSPaddingMin];
        [_authImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_authImageView autoSetDimensionsToSize:CGSizeMake(15, 15)];
        
        _subTitleLabel1 = [UILabel newAutoLayoutView];
        _subTitleLabel1.textColor = [UIColor flsCancelColor];
        _subTitleLabel1.font = [UIFont emFontSmall];
        [self.contentView addSubview:_subTitleLabel1];
        [_subTitleLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_titleLabel];
        [_subTitleLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:kEMSPaddingSmall];
        
        _subTitleLabel2 = [UILabel newAutoLayoutView];
        _subTitleLabel2.textColor = [UIColor flsCancelColor];
        _subTitleLabel2.font = [UIFont emFontSmall];
        [self.contentView addSubview:_subTitleLabel2];
        [_subTitleLabel2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:kEMSPaddingSmall];
        [_subTitleLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(60 + kEMSPaddingLarge + kEMSPaddingNormal)];
        
        _subTitleLabel3 = [UILabel newAutoLayoutView];
        _subTitleLabel3.textColor = [UIColor flsCancelColor];
        _subTitleLabel3.font = [UIFont emFontSmall];
        [self.contentView addSubview:_subTitleLabel3];
        [_subTitleLabel3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_titleLabel];
        [_subTitleLabel3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_subTitleLabel1 withOffset:kEMSPaddingSmall];
        
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.textColor = [UIColor flsCancelColor];
        _contentLabel.font = [UIFont emFontSmall];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingLarge];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingLarge];
        [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_aImageView withOffset:kEMSPaddingLarge];
    }
    return self;
}

+(CGFloat)defaultHeightWithContent:(NSString *)content
{
    CGFloat contentHeight = [content sizeWithFont:[UIFont emFontSmall] byWidth:(UIDeviceScreenWidth - kEMSPaddingLarge * 2)].height;
    
    return kEMSPaddingLarge /* 头像上间距 */
    + 80 /* 头像高度 */
    + kEMSPaddingLarge /* 头像与文本间距 */
    + contentHeight /* 内容高度 */
    + kEMSPaddingLarge /* 内容下间距 */;
}

@end
