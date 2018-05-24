//
//  EMCollectionDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCollectionDelegateObj.h"
#import "EMPeakListCell.h"
#import "EMCollectionListViewModel.h"

@implementation EMCollectionDelegateObj

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMPeakListCellID";
    EMPeakListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMPeakListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMAlbumBaseInfo *albumObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:albumObj.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
    cell.titleLabel.text = albumObj.title;
    
    cell.subTitleLabel1.text  = [NSString stringWithFormat:@"更新时间：%@", [NSString stringFormatIntervalSince1970_YearMonthDayHourMinute_Line:albumObj.lastUptrackAt/1000]];
    cell.subTitleLabel2.text  = [NSString stringWithFormat:@"► %@   ☫%@集", @(albumObj.playsCounts), @(albumObj.tracks)];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMPeakListCell selfHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMAlbumBaseInfo *albumObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.didSelectRowCommand execute:(id)albumObj];
}

@end
