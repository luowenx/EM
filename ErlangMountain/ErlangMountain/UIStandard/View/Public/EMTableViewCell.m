//
//  EMTableViewCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

@implementation EMTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _bottomLine = [UIView newAutoLayoutView];
        _bottomLine.backgroundColor = [UIColor flsSpaceLineColor];
        [self.contentView addSubview:_bottomLine];
        [_bottomLine autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [_bottomLine autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_bottomLine autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [_bottomLine autoSetDimension:ALDimensionHeight toSize:.5];
    }
    return self;
}

@end
