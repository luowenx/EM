//
//  EMRecommendSubDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendSubDelegateObj.h"
#import "EMRecomendSubCell.h"
#import "EMRecommendSubViewModel.h"

@implementation EMRecommendSubDelegateObj


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"EMRecomendSubCellid";
    EMRecomendSubCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[EMRecomendSubCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    EMBookDetailInfo *info = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [cell.realImageView sd_setImageWithURL:[NSURL URLWithString:info.coverMiddle] placeholderImage:EMPublicPlaceholder_Small];
    
    cell.titleLabel.text = info.title;
    cell.subTitleLabel1.text = info.intro;
    cell.subTitleLabel2.text = [NSString stringWithFormat:@"► %@   ☫%@集", @(info.playsCounts), @(info.tracks)];
   
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [EMRecomendSubCell selfHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMBookDetailInfo *info = [self.viewModel.dataArray safeObjectAtIndex:indexPath.row];
    [self.viewModel.didBookDetailCommend execute:(id)info];
}

@end
