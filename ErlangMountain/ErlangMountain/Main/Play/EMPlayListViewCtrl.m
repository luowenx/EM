//
//  EMPlayListViewCtrl.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayListViewCtrl.h"
#import "EMPlayListCell.h"

#import "EMPlayItemInfo.h"

@interface EMPlayListViewCtrl ()

@end

@implementation EMPlayListViewCtrl

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.dataList addObjectsFromArray:_playList];
}

-(void)initUI
{
    self.title = @"播放列表";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"EMPlayListCell";
    EMPlayListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[EMPlayListCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellid];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    EMPlayItemInfo *info = [dataList_ safeObjectAtIndex:indexPath.row];
    cell.aImageView.image = imageWithName(@"play_run_disable");
    cell.titleLable.text = info.title;
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EMPlayItemInfo *info = [dataList_ safeObjectAtIndex:indexPath.row];
    @weakify(self)
    [self dismissViewControllerAnimated:YES completion:^{
        if (self_weak_.didSelectRow) {
            self_weak_.didSelectRow(info);
        }
    }];
}



@end
