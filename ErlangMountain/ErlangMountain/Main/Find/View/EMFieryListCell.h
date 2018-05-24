//
//  EMFieryListCell.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTableViewCell.h"

/**
 发现主播列表cell
 */
@class EMCellHeaderView, EMFieryItemCell;
@interface EMFieryListCell : EMTableViewCell

@property (nonatomic, strong, readonly) EMCellHeaderView * headerView;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;


@property (nonatomic, copy) void (^cellForRow)(EMFieryItemCell *theCell, NSIndexPath *theIndexPath) ;
@property (nonatomic, copy) NSInteger (^numberOfItemsInSection)(void);
@property (nonatomic, copy) void (^didSelectItem)(NSIndexPath *atIndexPath);

@end
