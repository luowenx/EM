//
//  EMAlbumDetailHeaderView.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 专辑详情 头部
 */
@interface EMAlbumDetailHeaderView : UIView

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIImageView *coverImageView;

@property (nonatomic, strong) UIImageView *avatarImagView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel * contentLabel;

@property (nonatomic, strong) UIButton * backButton;

@property (nonatomic, strong) UIButton *collectionButton;

+(CGFloat)defaultHeight;

@end
