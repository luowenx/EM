//
//  EMAlbumEpisodeCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumEpisodeCell.h"

@implementation EMAlbumEpisodeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.realImageView roundedRectWith:30];
    }
    return self;
}

+(CGFloat)selfHeight
{
    return 90;
}

@end
