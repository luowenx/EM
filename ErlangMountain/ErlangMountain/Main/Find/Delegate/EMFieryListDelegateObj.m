
//
//  EMFieryListDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryListDelegateObj.h"
#import "EMFieryListViewModel.h"
#import "EMFieryListCell.h"
#import "EMFieryItemCell.h"
#import "EMCellHeaderView.h"
#import "EMAnchor.h"

@implementation EMFieryListDelegateObj

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMFieryListCellid";
    EMFieryListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[EMFieryListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    EMFieryListObj *listObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    cell.headerView.headerTitleLabel.text = listObj.title;
    
    // 具体个数
    cell.numberOfItemsInSection = ^NSInteger{
        return listObj.list.count;
    };
    
    @weakify(self)
    cell.cellForRow = ^(EMFieryItemCell *theCell, NSIndexPath *theIndexPath) {
        @strongify(self)
        EMAnchor *anchor = [listObj.list safeObjectAtIndex:theIndexPath.row];
        [theCell.imageView sd_setImageWithURL:[NSURL URLWithString:anchor.smallLogo] placeholderImage:EMPublicPlaceholder_Small];
        theCell.titleLabel.text = anchor.nickname;
        RAC(theCell.followButton, selected) = [RACObserve(anchor, isFollowed) takeUntil:theCell.rac_prepareForReuseSignal];
        
        [[[theCell.followButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] takeUntil:theCell.rac_prepareForReuseSignal] subscribeNext:^(id x) {
            [self.viewModel.followCommand execute:(id)anchor];
        }];
    };
    
    cell.didSelectItem = ^(NSIndexPath *atIndexPath) {
        EMAnchor *anchor = [listObj.list safeObjectAtIndex:atIndexPath.row];
        [self_weak_.viewModel.didAnchorCommand execute:(id)anchor];
    };
    
    cell.headerView.headerAction = ^{
        [self_weak_.viewModel.moreListCommand execute:(id)listObj];
    };
    
    [cell.collectionView reloadData];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMFieryItemCell selfHeight] + [EMCellHeaderView defaultHeight];
}

@end
