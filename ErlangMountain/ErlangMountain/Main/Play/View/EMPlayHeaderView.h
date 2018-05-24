//
//  EMPlayHeaderView.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 播放页头部
 */
@interface EMPlayHeaderView : UIView
@property (nonatomic, strong, readonly) UIImageView *backgroundImageView;

@property (nonatomic, strong, readonly) UIImageView * coverImageView;

@property (nonatomic, strong, readonly) UILabel * titleLabel;

@property (nonatomic, strong, readonly) UIButton * backButton;

@property (nonatomic, strong, readonly) UIButton *extendButton;

@property (nonatomic, strong, readonly) UILabel * currentTimeLabel;

@property (nonatomic, strong, readonly) UILabel * totalTimeLabel;

@property (nonatomic, strong, readonly) UIButton * openListButton;

@property (nonatomic, strong, readonly) UIButton * previousButton;

@property (nonatomic, strong, readonly) UIButton * runButton;

@property (nonatomic, strong, readonly) UIButton * nextButton;

@property (nonatomic, strong, readonly) UIButton * historyButton;

@property (nonatomic, strong, readonly) UISlider * slider;

+(CGFloat)defaultHeight;

@end
