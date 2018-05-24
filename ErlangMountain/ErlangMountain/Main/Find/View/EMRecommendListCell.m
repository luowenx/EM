//
//  EMRecommendListCell.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendListCell.h"
#import "EMCellHeaderView.h"
#import "EMRecommendItemCell.h"


static NSString *__innerEMRecommendItemCellID = @"__innerEMRecommendItemCellID";
@interface EMRecommendListCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong, readwrite) EMCellHeaderView * headerView;
@property (nonatomic, strong, readwrite) UICollectionView *collectionView;

@end


@implementation EMRecommendListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _headerView = [EMCellHeaderView newAutoLayoutView];
        [self.contentView addSubview:_headerView];
        [_headerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [_headerView autoSetDimension:ALDimensionHeight toSize:50];
        
        CGFloat ImageViewWidth = ([UIScreen mainScreen].bounds.size.width - kEMSPaddingNormal * 4)/3;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(floor(ImageViewWidth), [EMRecommendItemCell selfHeight]);
        layout.minimumLineSpacing = kEMSPaddingNormal;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, kEMSPaddingNormal, 0, kEMSPaddingNormal);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_collectionView];
        [_collectionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [_collectionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [_collectionView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [_collectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headerView];
        
        [_collectionView registerClass:[EMRecommendItemCell class] forCellWithReuseIdentifier:__innerEMRecommendItemCellID];

    }
    return self;
}

#pragma mark ===== UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger number = 0;
    if (self.numberOfItemsInSection) {
        number = self.numberOfItemsInSection();
    }
    return number;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EMRecommendItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__innerEMRecommendItemCellID forIndexPath:indexPath];
    
    if (self.cellForRow) {
        self.cellForRow(cell, indexPath);
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectItem) {
        self.didSelectItem(indexPath);
    }
}

@end
