//
//  EMCellHeaderView.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCellHeaderView.h"

@interface EMCellHeaderView ()

@property (nonatomic, strong, readwrite) UIImageView * headerImageView;

@property (nonatomic, strong, readwrite) UILabel * headerTitleLabel;

@property (nonatomic, strong, readwrite) UILabel * tailTitleLabel;

@property (nonatomic, strong, readwrite) UIImageView * tailImageView;

@end

@implementation EMCellHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _headerImageView = [UIImageView newAutoLayoutView];
        _headerImageView.image = imageWithName(@"findsection_logo");
        [self addSubview:_headerImageView];
        [_headerImageView autoSetDimensionsToSize:CGSizeMake(10, 10)];
        [_headerImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_headerImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        
        _headerTitleLabel = [UILabel newAutoLayoutView];
        _headerTitleLabel.font = [UIFont emFontNormal];
        [self addSubview:_headerTitleLabel];
        [_headerTitleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_headerTitleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headerImageView withOffset:kEMSPaddingMin];
        
        _tailImageView = [UIImageView newAutoLayoutView];
        _tailImageView.image = imageWithName(@"public_right");
        [self addSubview:_tailImageView];
        [_tailImageView autoSetDimensionsToSize:CGSizeMake(20, 20)];
        [_tailImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [_tailImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        _tailTitleLabel = [UILabel newAutoLayoutView];
        _tailTitleLabel.text = @"更多";
        _tailTitleLabel.font = [UIFont emFontSmall];
        _tailTitleLabel.textColor = [UIColor flsCancelColor];
        [self addSubview:_tailTitleLabel];
        [_tailTitleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_tailTitleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_tailImageView withOffset:kEMSPaddingMin];
        
        self.userInteractionEnabled = YES;
        @weakify(self)
        [self addTapGestureWithBlock:^(UIView *gestureView) {
            if (self_weak_.headerAction) {self_weak_.headerAction();}
        }];
    }
    return self;
}

+(CGFloat)defaultHeight
{
    return 50;
}

@end
