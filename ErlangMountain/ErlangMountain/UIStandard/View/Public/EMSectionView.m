//
//  EMSectionView.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMSectionView.h"

@implementation EMSectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = [UIColor flsCancelColor];
        _titleLabel.font = [UIFont emFontTiny];
        [self addSubview:_titleLabel];
        [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:kEMSPaddingNormal];
        [_titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    }
    return self;
}

+(instancetype)sectionWithTitle:(NSString *)title
{
    EMSectionView *section = [[EMSectionView alloc] initWithFrame:CGRectMake(0, 0, UIDeviceScreenWidth, [EMSectionView defaultHeight])];
    section.backgroundColor = [UIColor flsSpaceLineColor];
    section.titleLabel.text = title;
    return section;
}

+(CGFloat)defaultHeight
{
    return 20;
}

@end
