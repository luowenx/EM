//
//  EMFieryItemCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryItemCell.h"

@implementation EMFieryItemCell

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
        _titleLabel.font = [UIFont emFontNormal];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_imageView withOffset:0];
        [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imageView withOffset:kEMSPaddingMin];
        [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_imageView withOffset:0];
        
        _followButton = [UIButton newAutoLayoutView];
        _followButton.titleLabel.font = [UIFont emFontSmaller];
        
        [_followButton setTitle:@"已关注" forState:(UIControlStateSelected)];
        [_followButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];

        [_followButton setTitleColor:[UIColor flsMainColor2] forState:(UIControlStateNormal)];
        [_followButton setTitle:@"+ 关注" forState:(UIControlStateNormal)];

        _followButton.layer.cornerRadius = 2;
        _followButton.layer.borderColor = [UIColor flsMainColor2].CGColor;
        _followButton.layer.borderWidth = .5;
        
        @weakify(self)
        [RACObserve(_followButton, selected) subscribeNext:^(id x) {
            BOOL selected = [x boolValue];
            if (selected) {
                self_weak_.followButton.layer.borderWidth = .0;
                self_weak_.followButton.backgroundColor = [UIColor flsCancelColor];
            }else{
                self_weak_.followButton.layer.borderWidth = .5;
                self_weak_.followButton.backgroundColor = [UIColor whiteColor];
            }
        }];

        [self.contentView addSubview:_followButton];
        [_followButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_followButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:kEMSPaddingMin];
        [_followButton autoSetDimensionsToSize:CGSizeMake(65, 25)];
    }
    return self;
}


+(CGFloat)selfHeight
{
    static CGFloat selfHeight = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        selfHeight = [UIFont emFontNormal].lineHeight + kEMSPaddingMin * 2 + kEMSPaddingNormal + ([UIScreen mainScreen].bounds.size.width - kEMSPaddingNormal * 4)/3 + 30;
    });
    return selfHeight;
}

@end
