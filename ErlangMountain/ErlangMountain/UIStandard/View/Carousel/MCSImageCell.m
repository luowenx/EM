//
//  ImageCell.m
//  MCStandard
//
//  Created by xtkj on 16/9/12.
//  Copyright © 2016年 michong. All rights reserved.
//

#import "MCSImageCell.h"

@implementation MCSImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.adImageView  = [[UIImageView alloc] initWithFrame:self.bounds];
        self.adImageView.clipsToBounds  = YES;
        self.adImageView.contentMode    = UIViewContentModeScaleAspectFill;
        self.adImageView.image = [UIImage imageNamed:@"MCStandard.bundle/public_default_big"];  //占位图
        self.adImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.adImageView];
    }
    
    return self;
}



@end
