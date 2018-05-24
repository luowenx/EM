//
//  EMPlayListCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayListCell.h"

@implementation EMPlayListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _aImageView = [UIImageView newAutoLayoutView];
        [self.contentView addSubview:_aImageView];
        [_aImageView autoSetDimensionsToSize:CGSizeMake(30, 30)];
        [_aImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingLarge];
        [_aImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        _titleLable = [UILabel newAutoLayoutView];
        [self.contentView addSubview:_titleLable];
        [_titleLable autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_titleLable autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [_titleLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_aImageView withOffset:kEMSPaddingNormal];
    }
    return self;
}

@end
