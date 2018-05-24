//
//  EMPeakAnchorViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakAnchorViewModel.h"
#import "EMRankAnchorReq.h"
#import "EMPeakAnchor.h"
#import "EMFollowsManager.h"

@interface EMPeakAnchorViewModel ()

@property (nonatomic, strong) EMPeakListObj *peakObj;

@property (nonatomic, strong, readwrite) NSMutableArray<EMPeakAnchor *> * dataArray;

@end

@implementation EMPeakAnchorViewModel

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
    EMRankAnchorReq *req = [[EMRankAnchorReq alloc] init];
    req.pageId = page_;
    req.key = self.peakObj.key;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRankAnchorRes * res = (EMRankAnchorRes*)response;
        [self.dataArray removeAllObjects];
        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPeakAnchor objArrayWithDics:res.list]];
        [self.dataArray enumerateObjectsUsingBlock:^(EMPeakAnchor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [EMFollows synchroObj:obj compareKey:@"uid" synchroKey:@"isFollowed"];
        }];
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
    EMRankAnchorReq *req = [[EMRankAnchorReq alloc] init];
    req.pageId = self.page;
    req.key = self.peakObj.key;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRankAnchorRes * res = (EMRankAnchorRes*)response;
        NSArray *netArray = [EMPeakAnchor objArrayWithDics:res.list];
        [netArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [EMFollows synchroObj:obj compareKey:@"uid" synchroKey:@"isFollowed"];
        }];
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:netArray];
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


-(RACCommand *)followCommand
{
    if (!_followCommand) {
        _followCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMAnchor *input) {
            input.isFollowed = !input.isFollowed;
            if (input.isFollowed) {
                [EMFollows insertObj:input compareKey:@"uid"];
            }else{
                [EMFollows deleteObj:input compareKey:@"uid"];
            }
            return [RACSignal empty];
        }];
    }
    return _followCommand;
}

@end
