//
//  EMPlayHeaderView.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayHeaderView.h"

@interface EMPlayHeaderView ()
@property (nonatomic, strong, readwrite) UIImageView *backgroundImageView;
@property (nonatomic, strong, readwrite) UIImageView *coverImageView;
@property (nonatomic, strong, readwrite) UILabel * titleLabel;
@property (nonatomic, strong, readwrite) UIButton * backButton;
@property (nonatomic, strong, readwrite) UIButton * extendButton;
@property (nonatomic, strong, readwrite) UILabel * currentTimeLabel;
@property (nonatomic, strong, readwrite) UILabel * totalTimeLabel;
@property (nonatomic, strong, readwrite) UIButton * openListButton;
@property (nonatomic, strong, readwrite) UIButton * previousButton;
@property (nonatomic, strong, readwrite) UIButton * runButton;
@property (nonatomic, strong, readwrite) UIButton * nextButton;
@property (nonatomic, strong, readwrite) UIButton * historyButton;
@property (nonatomic, strong, readwrite) UISlider * slider;
@end

@implementation EMPlayHeaderView

-(instancetype)initWithFrame:(CGRect)frame
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
        
        _backButton = [UIButton newAutoLayoutView];
        [_backButton setImage:imageWithName(@"public_back_wihte") forState:(UIControlStateNormal)];
        [self addSubview:_backButton];
        [_backButton autoSetDimensionsToSize:CGSizeMake(44, 44)];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_backButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight];
        
        _extendButton = [UIButton newAutoLayoutView];
        [_extendButton setImage:imageWithName(@"public_share_light") forState:(UIControlStateHighlighted)];
        [_extendButton setImage:imageWithName(@"public_share_dark") forState:(UIControlStateNormal)];
        [_extendButton setImageEdgeInsets:UIEdgeInsetsMake(12, 12, 12, 12)];
        [self addSubview:_extendButton];
        [_extendButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [_extendButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLQStatusBarHeight];
        [_extendButton autoSetDimensionsToSize:CGSizeMake(44, 44)];

        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont emFontLarge];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [_titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_backButton];
        [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_backButton withOffset:-kEMSPaddingLarge];
        [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_extendButton withOffset:-kEMSPaddingNormal];

        CGFloat coverWidth = UIDeviceScreenWidth - 120;
        _coverImageView = [UIImageView newAutoLayoutView];
        [self addSubview:_coverImageView];
        [_coverImageView autoSetDimensionsToSize:CGSizeMake(coverWidth, coverWidth)];
        [_coverImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_backButton withOffset:kEMSPaddingNormal];
        [_coverImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        _currentTimeLabel = [UILabel newAutoLayoutView];
        _currentTimeLabel.textColor = [UIColor whiteColor];
        _currentTimeLabel.font = [UIFont emFontMini];
        _currentTimeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_currentTimeLabel];
        [_currentTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_currentTimeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_coverImageView];
        [_currentTimeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_coverImageView];
        
        _totalTimeLabel = [UILabel newAutoLayoutView];
        _totalTimeLabel.textColor = [UIColor whiteColor];
        _totalTimeLabel.font = [UIFont emFontMini];
        _totalTimeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_totalTimeLabel];
        [_totalTimeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_totalTimeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_coverImageView];
        [_totalTimeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_coverImageView];
        
        CGSize itemSize = CGSizeMake(32, 32);
        CGFloat padding = (UIDeviceScreenWidth - itemSize.width * 5)/6;
        
        _runButton = [UIButton newAutoLayoutView];
        [_runButton setBackgroundImage:imageWithName(@"play_run_background_normal") forState:(UIControlStateNormal)];
        [_runButton setBackgroundImage:imageWithName(@"play_run_background_normal") forState:(UIControlStateSelected)];
        [_runButton setBackgroundImage:imageWithName(@"play_run_disable") forState:(UIControlStateDisabled)];
        [_runButton setImage:imageWithName(@"play_run_normal") forState:(UIControlStateNormal)];
        [_runButton setImage:imageWithName(@"play_stop_normal") forState:(UIControlStateSelected)];
        [_runButton setImage:nil forState:(UIControlStateDisabled)];
        [self addSubview:_runButton];
        [_runButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_coverImageView withOffset:kEMSPaddingLarge];
        [_runButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_runButton autoSetDimensionsToSize:itemSize];
        
        _previousButton = [UIButton newAutoLayoutView];
        [_previousButton setImage:imageWithName(@"play_previous_normal") forState:(UIControlStateNormal)];
        [_previousButton setImage:imageWithName(@"play_previous_disable") forState:(UIControlStateDisabled)];
        [self addSubview:_previousButton];
        [_previousButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_runButton];
        [_previousButton autoSetDimensionsToSize:itemSize];
        [_previousButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_runButton withOffset:-padding];
        
        _openListButton = [UIButton newAutoLayoutView];
        [_openListButton setImage:imageWithName(@"play_list") forState:(UIControlStateNormal)];
        [self addSubview:_openListButton];
        [_openListButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_runButton];
        [_openListButton autoSetDimensionsToSize:itemSize];
        [_openListButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_previousButton withOffset:-padding];
        
        _nextButton = [UIButton newAutoLayoutView];
        [_nextButton setImage:imageWithName(@"play_next_normal") forState:(UIControlStateNormal)];
        [_nextButton setImage:imageWithName(@"play_next_disable") forState:(UIControlStateDisabled)];
        [self addSubview:_nextButton];
        [_nextButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_runButton];
        [_nextButton autoSetDimensionsToSize:itemSize];
        [_nextButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_runButton withOffset:padding];
        
        _historyButton = [UIButton newAutoLayoutView];
        [_historyButton setImage:imageWithName(@"play_history") forState:(UIControlStateNormal)];
        [self addSubview:_historyButton];
        [_historyButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_runButton];
        [_historyButton autoSetDimensionsToSize:itemSize];
        [_historyButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nextButton withOffset:padding];
        
        _slider = [UISlider newAutoLayoutView];
        [_slider setThumbImage:imageWithName(@"play_slider_block") forState:(UIControlStateNormal)];
        [_slider setMinimumTrackTintColor:[UIColor orangeColor]];
        [self addSubview:_slider];
        [_slider autoSetDimension:ALDimensionHeight toSize:20];
        [_slider autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingLarge];
        [_slider autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingLarge];
        [_slider autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kEMSPaddingMin];
    }
    return self;
}

+(CGFloat)defaultHeight
{
    return
    kLQStatusBarHeight /* 状态栏 */
    + 44 /* 标题 */
    + kEMSPaddingNormal /* 标题与封面间距 */
    + (UIDeviceScreenWidth - 120)  /* 封面宽高 */
    + kEMSPaddingLarge /* 封面与按钮直间距 */
    + 32  /* 按钮高度 */
    + kEMSPaddingHuge;
}

@end
