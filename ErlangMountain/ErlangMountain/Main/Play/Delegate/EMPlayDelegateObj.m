//
//  EMPlayDelegateObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayDelegateObj.h"
#import "EMPlayDetailInfoCell.h"
#import "EMPlayViewModel.h"

@implementation EMPlayDelegateObj

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"EMPlayDetailInfoCell";
    EMPlayDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[EMPlayDetailInfoCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid];
    }
    EMPlayDetailObj *detailObj = self.viewModel.detailObj;
    
    [cell.aImageView sd_setImageWithURL:[NSURL URLWithString:detailObj.userInfo.smallLogo] placeholderImage:EMPublicPlaceholder_Icon];
    cell.titleLabel.text = detailObj.nickname;
    cell.subTitleLabel1.text = [NSString stringWithFormat:@"作品 %@", @(detailObj.userInfo.tracks)];
    cell.subTitleLabel2.text = [NSString stringWithFormat:@"粉丝 %@", @(detailObj.userInfo.followings)];
    cell.subTitleLabel3.text = detailObj.userInfo.ptitle;
    cell.contentLabel.text = detailObj.title;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPlayDetailObj *detailObj = self.viewModel.detailObj;
    return [EMPlayDetailInfoCell defaultHeightWithContent:detailObj.title];
}

@end
