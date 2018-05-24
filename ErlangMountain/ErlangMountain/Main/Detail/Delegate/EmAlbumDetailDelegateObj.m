//
//  EmAlbumDetailDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EmAlbumDetailDelegateObj.h"
#import "EMAlbumEpisodeCell.h"
#import "EMAlbumDetailViewModel.h"
#import "EMSectionView.h"

@implementation EmAlbumDetailDelegateObj


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID =@"EMAlbumEpisodeCellid";
    EMAlbumEpisodeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMAlbumEpisodeCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMPlayItemInfo *playInfo = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:playInfo.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
    cell.titleLabel.text = playInfo.title;
    cell.subTitleLabel1.text = playInfo.nickname;
    cell.subTitleLabel2.text = [NSString stringWithFormat:@"► %@     ❤ %@     ✉ %@ ", @(playInfo.playtimes), @(playInfo.likes), @(playInfo.comments)];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [EMSectionView sectionWithTitle:[NSString stringWithFormat:@"共 %@ 集", @(self.viewModel.albumObj.tracks)]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMAlbumEpisodeCell selfHeight];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [EMSectionView defaultHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPlayItemInfo *playInfo = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.didWorkCommand execute:(id)playInfo];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UITableView *tableView = (UITableView *)scrollView;
    CGFloat sectionHeaderHeight = [self tableView:tableView heightForHeaderInSection:0];
    if(scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0,0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

@end
