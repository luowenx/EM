//
//  EMAnchorDtailDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDetailDelegateObj.h"
#import "EMAnchorDetailViewModel.h"
#import "EMPeakListCell.h"
#import "EMSectionView.h"

@implementation EMAnchorDetailDelegateObj


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMPeakListCellID";
    EMPeakListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMPeakListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMAnchorAlbumObj *albumObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:albumObj.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
    cell.titleLabel.text = albumObj.title;
    
    cell.subTitleLabel1.text  = [NSString stringWithFormat:@"更新时间：%@", [NSString stringFormatIntervalSince1970_YearMonthDayHourMinute_Line:albumObj.lastUptrackAt/1000]];
    cell.subTitleLabel2.text  = [NSString stringWithFormat:@"► %@   ☫%@集", @(albumObj.playTimes), @(albumObj.tracks)];
    
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
    EMAnchorAlbumObj *albumObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.didSelectRowCommand execute:(id)albumObj];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.viewModel.dataArray.count == 0) {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    return [EMSectionView sectionWithTitle:[NSString stringWithFormat:@"发布的专辑（%@）", @(self.viewModel.totalCount)]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.viewModel.dataArray.count == 0) {
        return 0.01;
    }
    return [EMSectionView defaultHeight];
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
