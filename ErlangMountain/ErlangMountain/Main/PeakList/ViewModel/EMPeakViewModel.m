//
//  EMPeakViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakViewModel.h"
#import "EMRankListReq.h"
#import "EMPeakAlbumInfo.h"

@interface EMPeakViewModel ()

@property (nonatomic, strong) EMPeakListObj *peakObj;

@property (nonatomic, strong, readwrite) NSMutableArray<EMPeakAlbumInfo *> * dataArray;

@end
@implementation EMPeakViewModel

- (instancetype)initWithPeakListObj:(EMPeakListObj *)peakObj
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        _peakObj = peakObj;
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    page_ = 1;
    EMRankListReq *req = [[EMRankListReq alloc] init];
    req.pageId = page_;
    req.key = self.peakObj.key;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRankListRes * res = (EMRankListRes*)response;
        [self.dataArray removeAllObjects];

        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPeakAlbumInfo objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
        
    } error:^(LQHttpError *error) {
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
        [self.errorCommand execute:error];
    }];
}


-(void)loadMoreData
{
    self.page ++;
    EMRankListReq *req = [[EMRankListReq alloc] init];
    req.pageId = self.page;
    req.key = self.peakObj.key;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRankListRes * res = (EMRankListRes*)response;
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPeakAlbumInfo objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
    } error:^(LQHttpError *error) {
        [self.footerStatusCommand execute:@(kEMFooterStatusEndRefresh)];
        [self.errorCommand execute:error];
    }];
}

@end
