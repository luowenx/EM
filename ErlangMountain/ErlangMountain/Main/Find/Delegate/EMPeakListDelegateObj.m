//
//  EMPeakListDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakListDelegateObj.h"
#import "MCSAutoScrollView.h"
#import "EMPeakListViewModel.h"
#import "EMPeakListCell.h"
#import "EMPeakListObj.h"
#import "EMKResult.h"
#import "EMSectionView.h"

@interface EMPeakListDelegateObj ()<AutoScrollDelegate>

@end

@implementation EMPeakListDelegateObj

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMPeakListCellID";
    EMPeakListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMPeakListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMPeakGroupObj *groupObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.section];
    EMPeakListObj *listObj = [groupObj.list safeObjectAtIndex:indexPath.row];
    
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:listObj.coverPath] placeholderImage:EMPublicPlaceholder_Small];
    cell.titleLabel.text = listObj.title;
    
    cell.subTitleLabel1.text  = ((EMKResult *)listObj.firstKResults.firstObject).title;
    cell.subTitleLabel2.text  = ((EMKResult *)[listObj.firstKResults safeObjectAtIndex:1]).title;

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    EMPeakGroupObj *groupObj = [self.viewModel.dataArray safeObjectAtIndex:section];
    return groupObj.list.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMPeakListCell selfHeight];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    EMPeakGroupObj *groupObj = [self.viewModel.dataArray safeObjectAtIndex:section];
    return [EMSectionView sectionWithTitle:groupObj.title];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [EMSectionView defaultHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPeakGroupObj *groupObj = [self.viewModel.dataArray safeObjectAtIndex:indexPath.section];
    EMPeakListObj *peakListObj = [groupObj.list safeObjectAtIndex:indexPath.row];
    [self.viewModel.didSelectRowCommand execute:(id)peakListObj];
}

#pragma mark ========  AutoScrollDelegate
- (void)autoScrollLoadImageCell:(MCSImageCell *)cell cellData:(EMFocuseImage *)data
{
    [cell.adImageView sd_setImageWithURL:[NSURL URLWithString:data.pic]];
}

@end
