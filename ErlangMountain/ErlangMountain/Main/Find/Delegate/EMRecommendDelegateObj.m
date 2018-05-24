//
//  EMRecommendDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendDelegateObj.h"
#import "EMRecommendListViewModel.h"
#import "EMRecommendListCell.h"
#import "EMRecommendItemCell.h"
#import "EMCellHeaderView.h"
#import "MCSAutoScrollView.h"

@interface EMRecommendDelegateObj ()<AutoScrollDelegate>

@end

@implementation EMRecommendDelegateObj

#pragma mark ========  UITableviewDeledate、UITableviewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMRecommendListCell";
    EMRecommendListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMRecommendListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMHotRecommendObj *recommendObj = [self.viewModel.hotRecommends safeObjectAtIndex:indexPath.row];
    cell.headerView.tailImageView.hidden = !recommendObj.hasMore;
    cell.headerView.tailTitleLabel.hidden = !recommendObj.hasMore;
    cell.headerView.headerTitleLabel.text = recommendObj.title;
    
    @weakify(self)
    cell.headerView.headerAction = ^{
        [self_weak_.viewModel.moreRecommendCommand execute:(id)recommendObj];
    };
    
    // 具体个数
    cell.numberOfItemsInSection = ^NSInteger{
        return recommendObj.list.count;
    };
    
    cell.cellForRow = ^(EMRecommendItemCell *theCell, NSIndexPath *theIndexPath) {
        EMRecommendItem *recommendItem = [recommendObj.list safeObjectAtIndex:theIndexPath.row];
        [theCell.imageView sd_setImageWithURL:[NSURL URLWithString:recommendItem.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
        theCell.titleLabel.text = recommendItem.title;
        theCell.contentLabel.text = recommendItem.trackTitle;
    };
    
    cell.didSelectItem = ^(NSIndexPath *atIndexPath) {
        EMRecommendItem *recommendItem = [recommendObj.list safeObjectAtIndex:atIndexPath.row];
        [self_weak_.viewModel.didItemCommand execute:(id)recommendItem];
    };
    
    [cell.collectionView reloadData];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.hotRecommends.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMRecommendItemCell selfHeight] + [EMCellHeaderView defaultHeight];
}

#pragma mark ========  AutoScrollDelegate
- (void)autoScrollLoadImageCell:(MCSImageCell *)cell cellData:(EMFocuseImage *)data
{
    [cell.adImageView sd_setImageWithURL:[NSURL URLWithString:data.pic]];
}

@end
