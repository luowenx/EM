//
//  EMFieryItemCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 主播cell
 */
@interface EMFieryItemCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView * imageView;

@property (nonatomic, strong, readonly) UILabel * titleLabel;

@property (nonatomic, strong, readonly) UIButton * followButton;

+(CGFloat)selfHeight;

@end
