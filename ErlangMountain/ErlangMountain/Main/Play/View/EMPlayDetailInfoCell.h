//
//  EMPlayDetailInfoCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

/**
 播放页详情cell
 */
@interface EMPlayDetailInfoCell : EMTableViewCell
@property (nonatomic, strong) UIImageView *aImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *authImageView;
@property (nonatomic, strong) UILabel *subTitleLabel1;
@property (nonatomic, strong) UILabel *subTitleLabel2;
@property (nonatomic, strong) UILabel *subTitleLabel3;
@property (nonatomic, strong) UILabel *contentLabel;

+(CGFloat)defaultHeightWithContent:(NSString *)content;

@end
