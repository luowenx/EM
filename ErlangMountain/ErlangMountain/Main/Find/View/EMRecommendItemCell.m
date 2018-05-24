//
//  EMRecommendItemCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendItemCell.h"

@interface EMRecommendItemCell ()

@property (nonatomic, strong, readwrite) UIImageView * imageView;

@property (nonatomic, strong, readwrite) UILabel * titleLabel;

@property (nonatomic, strong, readwrite) UILabel * contentLabel;

@end

@implementation EMRecommendItemCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat ImageViewWidth = ([UIScreen mainScreen].bounds.size.width - kEMSPaddingNormal * 4)/3;
        _imageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_imageView];
        [_imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_imageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [_imageView autoSetDimensionsToSize:CGSizeMake(ImageViewWidth, ImageViewWidth)];
        
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont emFontSmaller];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_imageView withOffset:kEMSPaddingMin];
        [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_imageView withOffset:- kEMSPaddingMin];
        [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_imageView withOffset:kEMSPaddingMin];
        
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.font = [UIFont emFontSmaller];
        _contentLabel.numberOfLines = 2;
        [self addSubview:_contentLabel];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imageView withOffset:kEMSPaddingMin];

    }
    return self;
}


+(CGFloat)selfHeight
{
    static CGFloat selfHeight = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        selfHeight = [UIFont emFontSmaller].lineHeight * 2 + kEMSPaddingMin + kEMSPaddingNormal + ([UIScreen mainScreen].bounds.size.width - kEMSPaddingNormal * 4)/3;
    });
    return selfHeight;
}

@end
