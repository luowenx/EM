//
//  EMRankAnchorCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRankAnchorCell.h"

@implementation EMRankAnchorCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _followButton = [UIButton newAutoLayoutView];
        _followButton.titleLabel.font = [UIFont emFontSmaller];
        
        [_followButton setTitle:@"已关注" forState:(UIControlStateSelected)];
        [_followButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        
        [_followButton setTitleColor:[UIColor flsMainColor2] forState:(UIControlStateNormal)];
        [_followButton setTitle:@"+ 关注" forState:(UIControlStateNormal)];
        
        _followButton.layer.cornerRadius = 2;
        _followButton.layer.borderColor = [UIColor flsMainColor2].CGColor;
        _followButton.layer.borderWidth = .5;
        
        @weakify(self)
        [RACObserve(_followButton, selected) subscribeNext:^(id x) {
            BOOL selected = [x boolValue];
            if (selected) {
                self_weak_.followButton.layer.borderWidth = .0;
                self_weak_.followButton.backgroundColor = [UIColor flsCancelColor];
            }else{
                self_weak_.followButton.layer.borderWidth = .5;
                self_weak_.followButton.backgroundColor = [UIColor whiteColor];
            }
        }];
        
        [self.contentView addSubview:_followButton];
        [_followButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [_followButton autoSetDimensionsToSize:CGSizeMake(65, 25)];
        [_followButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:kEMSPaddingNormal];
        [_followButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.titleContentView withOffset:kEMSPaddingSmall];
    }
    return self;
}

+(CGFloat)selfHeight
{
    static CGFloat selfHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        selfHeight = 50 + kEMSPaddingNormal * 2;
    });
    return selfHeight ;
}

@end
