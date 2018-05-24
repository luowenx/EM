//
//  EMAnchorDetailHeaderView.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDetailHeaderView.h"

@interface EMAnchorDetailHeaderView ()

@property (nonatomic, strong) UIView * followView;

@end

@implementation EMAnchorDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [UIImageView newAutoLayoutView];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [_backgroundImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:100];
        
        UIToolbar *maskView = [UIToolbar newAutoLayoutView];
        maskView.barStyle = UIBarStyleBlackTranslucent;
        maskView.alpha = .8;
        [self addSubview:maskView];
        [maskView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        _followView = [UIView newAutoLayoutView];
        _followView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_followView];
        [_followView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [_followView autoSetDimension:ALDimensionHeight toSize:100];
        
        _backButton = [UIButton newAutoLayoutView];
        [_backButton setImage:imageWithName(@"public_back_wihte") forState:(UIControlStateNormal)];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 28, 28);
        [self addSubview:_backButton];
        [_backButton autoSetDimensionsToSize:CGSizeMake(44, 44)];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight + 20];
        
        _imageView = [UIImageView newAutoLayoutView];
        [_imageView roundedRectWith:40];
        [self addSubview:_imageView];
        [_imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight + 10];
        [_imageView autoSetDimensionsToSize:CGSizeMake(80, 80)];
        
        _shrinkButton = [UIButton newAutoLayoutView];
        [_shrinkButton setImage:imageWithName(@"iconfont-updown") forState:(UIControlStateNormal)];
        [_shrinkButton setImage:imageWithName(@"iconfont-xiangxia") forState:(UIControlStateSelected)];
        [self addSubview:_shrinkButton];
        [_shrinkButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_shrinkButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_followView withOffset:- kEMSPaddingSmall];
        
        _describeLabel = [UILabel newAutoLayoutView];
        _describeLabel.textColor = [UIColor whiteColor];
        _describeLabel.textAlignment = NSTextAlignmentCenter;
        _describeLabel.font = [UIFont emFontSmall];
        [self addSubview:_describeLabel];
        [_describeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_shrinkButton withOffset:0];
        [_describeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSMarginHuge];
        [_describeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSMarginHuge];
        
        _nickNameLabel = [UILabel newAutoLayoutView];
        _nickNameLabel.textColor = [UIColor whiteColor];
        _nickNameLabel.textAlignment = NSTextAlignmentCenter;
        _nickNameLabel.font = [UIFont emFontLarge];
        [self addSubview:_nickNameLabel];
        [_nickNameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_describeLabel withOffset:-kEMSPaddingSmall];
        [_nickNameLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        _followButton = [UIButton newAutoLayoutView];
        [_followButton setBackgroundImage:imageWithName(@"btn_unfollow_n") forState:(UIControlStateNormal)];
        [_followButton setBackgroundImage:imageWithName(@"btn_follow_n") forState:(UIControlStateSelected)];
        [_followView addSubview:_followButton];
        [_followButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingSuper];
        [_followButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingSuper];
        [_followButton autoSetDimension:ALDimensionHeight toSize:30];
        [_followButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kEMSPaddingNormal];

        _fansLabel = [UILabel newAutoLayoutView];
        _fansLabel.font = [UIFont emFontNormal];
        _fansLabel.text = @"粉丝";
        _fansLabel.textColor = [UIColor flsCancelColor];
        [_followView addSubview:_fansLabel];
        [_fansLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_fansLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kEMSPaddingSmall];
        
        _fansNumLabel = [UILabel newAutoLayoutView];
        _fansNumLabel.text = @"44729";
        [_followView addSubview:_fansNumLabel];
        [_fansNumLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_fansLabel];
        [_fansNumLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followButton withOffset:kEMSPaddingSmall];
        
        _followLabel = [UILabel newAutoLayoutView];
        _followLabel.font = [UIFont emFontNormal];
        _followLabel.text = @"关注";
        _followLabel.textColor = [UIColor flsCancelColor];
        [_followView addSubview:_followLabel];
        [_followLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kEMSPaddingSmall];
        [_followLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_followButton];
        
        _followNumLabel = [UILabel newAutoLayoutView];
        _followNumLabel.text = @"1";
        [_followView addSubview:_followNumLabel];
        [_followNumLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_followLabel];
        [_followNumLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followButton withOffset:kEMSPaddingSmall];
        
        _likeLabel = [UILabel newAutoLayoutView];
        _likeLabel.text = @"收藏";
        _likeLabel.font = [UIFont emFontNormal];
        _likeLabel.textColor = [UIColor flsCancelColor];
        [_followView addSubview:_likeLabel];
        [_likeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_followButton];
        [_likeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kEMSPaddingSmall];

        _likeNumLabel = [UILabel newAutoLayoutView];
        _likeNumLabel.text = @"0";
        [_followView addSubview:_likeNumLabel];
        [_likeNumLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:_likeLabel];
        [_likeNumLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_followButton withOffset:kEMSPaddingSmall];
        
    }
    return self;
}



+(CGFloat)defaultHeight
{
    return 270 + kLQStatusBarHeight;
}

@end
