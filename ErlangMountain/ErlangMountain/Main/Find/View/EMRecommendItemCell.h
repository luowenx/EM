//
//  EMRecommendItemCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 发现推荐item
 */
@interface EMRecommendItemCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView * imageView;

@property (nonatomic, strong, readonly) UILabel * titleLabel;

@property (nonatomic, strong, readonly) UILabel * contentLabel;

+(CGFloat)selfHeight;

@end
