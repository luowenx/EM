//
//  EMAlbumDetailHeaderView.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumDetailHeaderView.h"

@interface EMAlbumDetailHeaderView ()

@end

@implementation EMAlbumDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [UIImageView newAutoLayoutView];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        UIToolbar *maskView = [UIToolbar newAutoLayoutView];
        maskView.barStyle = UIBarStyleBlackTranslucent;
        maskView.alpha = .8;
        [self addSubview:maskView];
        [maskView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        _coverImageView = [UIImageView newAutoLayoutView];
        [self addSubview:_coverImageView];
        [_coverImageView autoSetDimensionsToSize:CGSizeMake(120, 120)];
        [_coverImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_coverImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kEMSPaddingSuper + kLQStatusBarHeight];
        [_coverImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kEMSPaddingLarge];
        
        _avatarImagView = [UIImageView newAutoLayoutView];
        [_avatarImagView roundedRectWith:15];
        [self addSubview:_avatarImagView];
        [_avatarImagView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_coverImageView];
        [_avatarImagView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_coverImageView withOffset:kEMSPaddingNormal];
        [_avatarImagView autoSetDimensionsToSize:CGSizeMake(30, 30)];

        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont emFontNormal];
        [self addSubview:_titleLabel];
        [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_coverImageView];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_avatarImagView withOffset:kEMSPaddingNormal];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        
        _contentLabel = [UILabel newAutoLayoutView];
        _contentLabel.font = [UIFont emFontSmall];
        _contentLabel.textColor = [UIColor flsSpaceLineColor];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
        [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_avatarImagView withOffset:kEMSPaddingSmall];
        [_contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_avatarImagView];
        [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_coverImageView withOffset:0 relation:(NSLayoutRelationLessThanOrEqual)];
        [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        
//        public_back_wihte
        _backButton = [UIButton newAutoLayoutView];
        [_backButton setImage:imageWithName(@"public_back_wihte") forState:(UIControlStateNormal)];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 28, 28);
        [self addSubview:_backButton];
        [_backButton autoSetDimensionsToSize:CGSizeMake(44, 44)];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight];
        
        _collectionButton = [UIButton newAutoLayoutView];
        _collectionButton.titleLabel.font = [UIFont emFontSmall];
        [_collectionButton setCornerRadius:5 borderColor:[UIColor whiteColor] borderWidth:.5];
        [_collectionButton setTitle:@"收藏" forState:(UIControlStateNormal)];
        [_collectionButton setTitle:@"已收藏" forState:(UIControlStateSelected)];
        [_collectionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_collectionButton setTitleColor:[UIColor flsCancelColor] forState:UIControlStateSelected];
        [self addSubview:_collectionButton];
        [_collectionButton autoSetDimensionsToSize:CGSizeMake(70, 27)];
        [_collectionButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight];
        [_collectionButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
    }
    return self;
}

+(CGFloat)defaultHeight
{
    return kLQStatusBarHeight + 150 + 15;
}

@end
