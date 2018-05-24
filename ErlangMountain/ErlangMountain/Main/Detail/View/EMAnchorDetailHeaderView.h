//
//  EMAnchorDetailHeaderView.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 主播详情
 */
@interface EMAnchorDetailHeaderView : UIView
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *describeLabel;
@property (nonatomic, strong) UIButton *shrinkButton;
@property (nonatomic, strong) UIButton *followButton;
@property (nonatomic, strong) UILabel *followNumLabel;
@property (nonatomic, strong) UILabel *followLabel;
@property (nonatomic, strong) UILabel *fansNumLabel;
@property (nonatomic, strong) UILabel *fansLabel;
@property (nonatomic, strong) UILabel *likeNumLabel;
@property (nonatomic, strong) UILabel *likeLabel;

+(CGFloat)defaultHeight;

@end
