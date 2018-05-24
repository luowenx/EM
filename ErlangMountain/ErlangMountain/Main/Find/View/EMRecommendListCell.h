//
//  EMRecommendListCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/23.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

/**
 推荐列表cell
 */
@class EMCellHeaderView, EMRecommendItemCell;
@interface EMRecommendListCell : EMTableViewCell

@property (nonatomic, strong, readonly) EMCellHeaderView * headerView;
@property (nonatomic, strong, readonly) UICollectionView *collectionView;

@property (nonatomic, copy) void (^cellForRow)(EMRecommendItemCell *theCell, NSIndexPath *theIndexPath) ;
@property (nonatomic, copy) NSInteger (^numberOfItemsInSection)(void);
@property (nonatomic, copy) void (^didSelectItem)(NSIndexPath *atIndexPath);

@end
