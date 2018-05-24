//
//  EMPlayHistoryDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayHistoryDelegateObj.h"
#import "EMAlbumEpisodeCell.h"
#import "EMPlayHistoryViewModel.h"

@implementation EMPlayHistoryDelegateObj


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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMAlbumEpisodeCell selfHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPlayItemInfo *playInfo = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.playCommand execute:(id)playInfo];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPlayItemInfo *playInfo = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.removeCommand execute:(id)playInfo];
}


@end
