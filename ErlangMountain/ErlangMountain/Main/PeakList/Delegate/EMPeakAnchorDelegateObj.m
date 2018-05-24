//
//  EMPeakAnchorDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakAnchorDelegateObj.h"
#import "EMPeakAnchorViewModel.h"
#import "EMRankAnchorCell.h"

@implementation EMPeakAnchorDelegateObj


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMRankAnchorCell";
    EMRankAnchorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMRankAnchorCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMPeakAnchor *anchor = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:anchor.middleLogo] placeholderImage:EMPublicPlaceholder_Icon];
    cell.titleLabel.text = anchor.nickname;
    cell.subTitleLabel.text = [NSString stringWithFormat:@"作品%@  粉丝%@", @(anchor.tracksCounts), @(anchor.followersCounts)];
    RAC(cell.followButton, selected) = [RACObserve(anchor, isFollowed) takeUntil:cell.rac_prepareForReuseSignal];

    @weakify(self)
    [[[cell.followButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] takeUntil:cell.rac_prepareForReuseSignal] subscribeNext:^(id x) {
        [self_weak_.viewModel.followCommand execute:(id)anchor];
    }];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMRankAnchorCell selfHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPeakAnchor *anchor = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.didSelectRowCommand execute:(id)anchor];
}


@end



